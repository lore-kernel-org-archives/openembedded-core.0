Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50679C28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 21:05:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.23708.1661202343431489313
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 14:05:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=b4m/eW5S;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5233a6570f=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27MHPLwq000912
	for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 14:05:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=P9EBziIok5KgXL86SopVZvFTD5lZv+BBzye3Rti7/K0=;
 b=b4m/eW5SmUHm+7e3QjfPhwB+GYRBVbBl1mEgMXEfWcYvbbwJrlSQKqjEGM1pEi9f8O+q
 Ot1UvbSfbNYGxnx9Hhv1pQ7ksIkN/xtDp02Z/3ucBD40DYhGvJcgQGZ03Qw2ucFTXePH
 dDF8b1cbiAFTMZCDTw1vWQkfa8E33ZdHFH3E9v6eua9/1Ii7akt2l92Qtoweg95KAJuT
 0fM6fcII7BMgu29NGsfLAbvCl2R+x5Y2Zn9ghBQGU0tWX8FWapInjwqBw6x9fTbxDLNE
 qezLgGWkzZjew/uhJgGaWFmPdXbhcjEu/SA+kUR6Yrf5S49dqZjs+20YkgrSDSjgbrNg Pg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j2w11t8vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 14:05:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fCwE5VlnpKtYVllqC+Wm3cSa6J6914TLe8NAgQoUW8tWpxE7y5dGClXxmtT2RLq2pqDnOcoWo1lKFknH9frurlodLXyjxIjKxAMnhKExrnJo2K8IhEVQZjMMsDoRNQnv60se3fhCcuDFtKgdpWyoYFKST1f6QIHMXvMyBuuDnSpT2AnR3UGqdhRLD6i5AVg88kN1PlDYA8/JuLUanbAt5RL+t4mVvvXfirtXbK4oRXLYm5pbCaFksivSFIXzt93lealUlSrSEe1ipJQyEJdzxNGGHAysubsZwUowldMIEPDeo5gkcozjt7LRYfhL6x0O5EFeI/HC5H4iT0LIkKb6uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9EBziIok5KgXL86SopVZvFTD5lZv+BBzye3Rti7/K0=;
 b=of5FOeOHTyMSsq7bOWX5UB1V/rRIxL517Xu+D7rmCBYaB5UUJT3qbyGrgHkqb1DWdeq9w9yqbrGgN1PJU1QYsoT8nIfJ7Y408O4w4b/WUzAjUkKbeoxG6VT9HoFcUtdPmlb6PfO9wsB5yPV/wgmZ41m6dMMt32E3Lz3rNMHd6bsEqBkK/ymUTZgSbFuwEpcmyC1Np2aKnIXDYPQc+RtQpU41MjS0MJmzkWlUO3qik+IG+sE9oftYZQPHODfCXSBdMXCYhpfzJUIBqD/8ImQ210dGT8718BuIq0Ujq3dmnH130VSz4NkozhvfBLBCNSxz6hp2CWzurh75wY1ahPNJNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM6PR11MB3434.namprd11.prod.outlook.com (2603:10b6:5:70::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.22; Mon, 22 Aug 2022 21:05:37 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3526:31b1:a7c:cd2]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3526:31b1:a7c:cd2%5]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 21:05:37 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH] dpkg: fix CVE-2022-1664
Date: Mon, 22 Aug 2022 17:05:13 -0400
Message-Id: <20220822210513.1494-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0310.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::18) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3777046a-057d-41d4-8936-08da84820fce
X-MS-TrafficTypeDiagnostic: DM6PR11MB3434:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MQurh85hoIieihl9wBGnil8P3cqFPqCaN2rNPp+6U3+8abJ9TObvbvfsPL2udfJrwhwITzYgdGRYRrMox3mYl1MN7JoyF38QPJraMbotmKCdlZ8tg8b5yANoVyTl/7mIgS1h3hTOIqvqjtuBWlM4N4e8QWiUFPMqBGnHxHDSXZadrEgUA7aje5Ns+tZmxgndpMU7kr1hVSNSqpMSykNfrNTT3iiHAcKeaf11ZSrjmiNCHs88X1olBHOuOXJI55NnrkH0GPoZu+muFD6/7gKxTNE217Epf4S2YaJ/t3kfP5Do2kQSbIj7q/HRgMaIEG2Hh6Q54+pt/2Bh3mEuDxRvw6HGVcNHGaiHQLMV9GVNA2qkwsmu0JwnwxyeKe2JMTBh/7L8NYRJ1/2Q+3eBQueAh4ZJGCZ6pTrvx13xR+Dzd1zdulxfVR8iLN8AqKoJOjlgbuVfzIGqLx0gvjR1DiN66aiuzfqU8/tkJDXz5yH4OWQbcsb/99CWokEh1S4y2Mw6/xLrw3ejyUa18DYDS8F7fTKLAcN8fbWZV1+D3zd2ocCnBh9UbJ9mSBausZpoOe+JZdRMe/Jz7Xk0QxZbHbztWg1Hd3hvWbQ5TX47PP5O1SCrcX1KwYVLrIy0DeSD8LKI/+t50T9sIBJ5FBqIhCwxnvODnZN6ruk7UOpa1KQBdq0HuIUuXs9h2jMYDxe4YMb8F3GHumaclGlKJEw5Npnv60NuhyBW/HUXW+62TC22qVy7heilGIWHSkBj5fY39ZiIRQ9dcCbzK2aR9LVVWeswcw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(136003)(39850400004)(366004)(36756003)(2616005)(186003)(1076003)(86362001)(38100700002)(38350700002)(83380400001)(6486002)(316002)(6916009)(8676002)(41300700001)(66946007)(66556008)(66476007)(478600001)(52116002)(8936002)(2906002)(6666004)(6506007)(30864003)(44832011)(6512007)(26005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fGL5KrbRngTqwQBi9CYeDzNGRrh7NxkprwYOANnqJjG+5dCv2bcQJz3sZzgj?=
 =?us-ascii?Q?eF25Ou/Ar9pCdCXcFltanPHwFGQAHHfNg09/nsjTtbGjSP4TX++Hf1DxZlRu?=
 =?us-ascii?Q?SDyRTK0qGsKngVL3t4BYAEcPtNJEAh8wTy4oNxfDfTegkz7EEumlakLn5rQT?=
 =?us-ascii?Q?s9Jj0m+ddQr1G3SnaJxSmPL5GF3mAsI+T3kvBRwsz2XZ/xOhyiNxg/OnrY3K?=
 =?us-ascii?Q?44eVzEDm9mQAHS3EyQuKgu9A0LnZqR7awwu6v0kS9qc7OdKjxtMh0+t6jCPt?=
 =?us-ascii?Q?XSty1+QhsrJmrNdkZ0HM0lIIm74XdF4iZIzTTwTK8A+ItjQakRX+TBzYAbsx?=
 =?us-ascii?Q?OWdx0ghDEsfZlwPhwoyNkBFh+6XkykJw081HkoRll6HqGoEmk7Q32csiiUPu?=
 =?us-ascii?Q?l89shEVxfvJOSnsMBWTIetvU13kgigtsmsXf0k46Tq8KoetfXk7l4RHPnTXB?=
 =?us-ascii?Q?SEnX4odpHrOAlLjylK7CAL+TtPO+bQH0rUY5tpnR70vgd8s3bSIQPhxP+wsW?=
 =?us-ascii?Q?YUdPc0iOk1IvEjk9dCSwJf0V/xWGwNriYNkbDND4eAh5qYFIIoc2nJfp3TLb?=
 =?us-ascii?Q?gUBI76LD46KtoD4rnOgo+otSxy2MSEgHXOgS6O4WS1FcFyn3G2AeguETWEeA?=
 =?us-ascii?Q?Pd/lqHIEAftDyfOZIxl0EHcTHj/ydldXjH0p3zQPJ49+l3wLBe7MvonVMPpo?=
 =?us-ascii?Q?5B8QEbkZKNrIN6HDNEEvACI25Jvgg2K5laDc0tYfsK+hG1OW8LiJ5DWCGWoz?=
 =?us-ascii?Q?AGlhaKxJt45Yy6P7rsRvogjokRutzjZuJ5iTNPr++GzgQmVe7SEZ5CHTTpP4?=
 =?us-ascii?Q?A+pJlWbN2XbjtijJPj4GisBlx7Kwp56M6fS/Da/jeOZW0h3xhTrtBIdtmyjm?=
 =?us-ascii?Q?nIkRoZun+87p9TLIj6LDgS0cRpaLGKjYBuqFuudbjF8G8OCJ4xG05IrxMz9f?=
 =?us-ascii?Q?xYSPq6fTgyI4LnrWzK4GAInkUdD7wKSyJt3Q0tgiRn14YwDnDMrg9zKyMXdh?=
 =?us-ascii?Q?nmj7Qzm0zJ4rq7fqOS9idt80iR/R8ajF4UAT+HMQ2pQOk0/fUPZhMw3+lL8F?=
 =?us-ascii?Q?1HEKFL8tjkao7t4FIv4t/AXxpotT7WczQ06h6vdMY4Ch+vjnSej8F3ijRePr?=
 =?us-ascii?Q?aNwkUbXfAWLakV6+opMlv4FzhPeikoKJ63Ds7CBkhHuJB/N/a3tVf8/tGFdv?=
 =?us-ascii?Q?nDmXu3p/4+zdG+msGynf24gvhX54GZEPQs/SgfP4dbpS77YfqB1FdSonqZwt?=
 =?us-ascii?Q?zX2QJLr/dZFIiRuT6LoXpRjG2aokxbZLAM2UiabzA1YG2kubVlif/uglxp1V?=
 =?us-ascii?Q?jRgXgQum+3sdRWQMb+niRr0FK8oE1lMIjie1BZLlut0anr8Loj23tAQkDhMh?=
 =?us-ascii?Q?sHJ3Q6BqmNo0fNZDu0gpEaUvfkfAsyUANs/rOcjAZOp3tgL2TGHHHRuf4+6M?=
 =?us-ascii?Q?RFQHNR2XZBIHuIBhlyc5WNrAXBJGNA0G/Lv27j82l8wcXYj1kZgS+7C+2gkN?=
 =?us-ascii?Q?gmoVtB4qmZUar/lgnzmiB8diQiKXLzKPpilCl868l7Tg0BypgxAiukE+o71l?=
 =?us-ascii?Q?3EXlGPXS1HCiIAbIEve+uFrDWUS3wEqsNsqDpWoTVxHVCYOj99DSPl+w1Mvg?=
 =?us-ascii?Q?Zg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3777046a-057d-41d4-8936-08da84820fce
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 21:05:37.3405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +LavW3QS26A2cZ90MdWHMGwI29dm3xETCQyHZVVcMn8C75kROrGUkvIkXqv8t18MM6UhR1hKmkRx6LT/V1Z0sSGyj7cv5HgI0UpTYm7dwDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3434
X-Proofpoint-ORIG-GUID: A64NWvWMoc0OjtVISdVIC_JfRmi4RqzK
X-Proofpoint-GUID: A64NWvWMoc0OjtVISdVIC_JfRmi4RqzK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-22_14,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208220087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Aug 2022 21:05:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169684

Backport patch to fix CVE-2022-1664.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...ive-Prevent-directory-traversal-for-.patch | 329 ++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.20.7.1.bb   |   1 +
 2 files changed, 330 insertions(+)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/0001-Dpkg-Source-Archive-Prevent-directory-traversal-for-.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-Dpkg-Source-Archive-Prevent-directory-traversal-for-.patch b/meta/recipes-devtools/dpkg/dpkg/0001-Dpkg-Source-Archive-Prevent-directory-traversal-for-.patch
new file mode 100644
index 0000000000..9333080d0e
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-Dpkg-Source-Archive-Prevent-directory-traversal-for-.patch
@@ -0,0 +1,329 @@
+From b4d16af26edae8a40bfaffdabdb6a4560de9f4b6 Mon Sep 17 00:00:00 2001
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
+(cherry picked from commit 7a6c03cb34d4a09f35df2f10779cbf1b70a5200b)
+
+Upstream-Status: Backport [58814cacee39c4ce9e2cd0e3a3b9b57ad437eff5]
+CVE: CVE-2022-1664
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
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.20.7.1.bb b/meta/recipes-devtools/dpkg/dpkg_1.20.7.1.bb
index 55ac84f724..fe3cfec5d3 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.20.7.1.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.20.7.1.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=sid \
            file://pager.patch \
            file://0001-Add-support-for-riscv32-CPU.patch \
            file://0013-scripts-dpkg-fsys-usrunmess.pl-correct-shebang.patch \
+           file://0001-Dpkg-Source-Archive-Prevent-directory-traversal-for-.patch \
            "
 
 SRC_URI_append_class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
-- 
2.33.0


