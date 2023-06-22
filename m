Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B00EB64DB
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 12:00:46 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.79])
 by mx.groups.io with SMTP id smtpd.web11.9396.1687435239209397004
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 05:00:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=CK1znP8b;
 spf=pass (domain: siemens.com, ip: 40.107.15.79, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O4S4QM0/fPQZv/llo/Ia5BD7Rq1vl/fNRiSy6Y+4T6ISDlmgylkpGgNM56AjiEQWsdzYqW1/Co4BP9Ag/Y8AVCaDsjqHkzKuQX6kLixugd0FY4QzbAOq/KkzTYjKtV9ajmgWZqKsWxr3//HcZnIJlPVKHj2UobP3k72RC3qTrc7rVO7y3PdtUBtQrrAsqbPZrk/es+QKSsjGPNoMIgsayrrTciD53kGng8c3VO4BCXjN5d+ftWTq/o7vIToCsXu8bM5F40neSLklg13RFY9Ce0hOGOzxJBMkZuAN6zWNfpMYsPsnsbmtOVAvOtTi9SkFrgof9b9eBOvECw35S2QGAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HbsV51S6M7HXOJvGZx6Vq6Vrj5Pg8QU657CM3r+ZX/M=;
 b=Dde/9VB2Q1q0maz1UmdJ+Ehc3+ftlYhlQlTln8cIXPUYk5/XZDHSryQRsuM2CstY9Ds3DdHDG1ZpACpk4ihKFe6EWR6N4veVFftE3VLIBrbFl6It0bee3c8cHGSCFRqbT8vuiRdwFnqspXW9tAI/3UTxXFrZ58NWDgPp585jYKeeJFjwsq9lByBKZuV9aqwKpTx/sMNOXQt5B/4JI6VfwD6ngo8kjTtC5E3Qwi62C1nYs5yMtWh+gT3CjkVHN5DU7QnF/Wf9xD3pyT6h2QsckYe3wTkeg6srsfDbUoPo7ERAVxEVSn6RYCIqi9lmnGo1mRGm/MpVUz06RhNIffdTkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.76) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HbsV51S6M7HXOJvGZx6Vq6Vrj5Pg8QU657CM3r+ZX/M=;
 b=CK1znP8bMLOKgHv4peOCbdOwiYI4XX/CbC3akfreUQrHmuqhdpmMN6U42uSx2sObeV+aPsi6iBffl6yhQjjxdO6JD1jysUMjVDnlx7Sbt7rTf/7QSEU7Cn5mNc23s3eWPfQMRcL++Z8h4XpChgR6rkUejQewVBzGcRqG5pGlLaoDi5eYiwlEQ+OUru0nKCv9apSvQgaZt49ZI4ZEEm6FyTDCI1cwiymSnfDOuowj4DQw2/Mce7FcvKjhysVF+ij3C0Z7IK1dj1MgTXxtcXGPrqdoW8umqnFjArbHsJhTFMYKpECYZdiEfoakmqaEiN6XJDe87dBa2oegidCFnmdIBw==
Received: from ZR0P278CA0082.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:22::15)
 by GV2PR10MB7560.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Thu, 22 Jun
 2023 12:00:33 +0000
Received: from VE1EUR01FT083.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:910:22:cafe::7b) by ZR0P278CA0082.outlook.office365.com
 (2603:10a6:910:22::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24 via Frontend
 Transport; Thu, 22 Jun 2023 12:00:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.76)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.76 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.76; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.76) by
 VE1EUR01FT083.mail.protection.outlook.com (10.152.3.59) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.24 via Frontend Transport; Thu, 22 Jun 2023 12:00:33 +0000
Received: from DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) by
 DEMCHDC8VSA.ad011.siemens.net (194.138.21.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 22 Jun 2023 14:00:32 +0200
Received: from md3hr6tc.ad001.siemens.net (163.242.56.90) by
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 22 Jun 2023 14:00:31 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>, Peter Marko
	<peter.marko@siemens.com>
Subject: [OE-core][PATCH v8 3/3] cve_check: convert CVE_CHECK_IGNORE to CVE_STATUS
Date: Thu, 22 Jun 2023 14:00:03 +0200
Message-ID: <20230622120009.28939-4-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230519081850.82586-1-andrej.valek@siemens.com>
References: <20230519081850.82586-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [163.242.56.90]
X-ClientProxiedBy: DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1EUR01FT083:EE_|GV2PR10MB7560:EE_
X-MS-Office365-Filtering-Correlation-Id: 551cd0d6-81ce-4439-c820-08db73184853
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4Lt1OEECheoW3L/kVRl+QMyols993uVDs1YW5voibQK4E20TI6a62JdPFnfsMQZfP/FmIYtVpgBDUZr+HOd/7pMzoQdsjKgy8wE8MZpI3lzNNeAL365uppPpqZpnfkycm5Gb2AMJK7QNVgb2oUGMcezXgH+1UcJ2Q8fYZxlYqJOTqoZpZyu1Q0dwqJTHTQU8Pm1Y5Y8dwNVjbd4lWqc2SnoqhO7v3ZWmHKnLSao/ZzRHrR3khO2gSY9jMXXsznt+mEs8s9p13i2Esd7LdnCYyAoZDrX7N6JcuRGZQViW+Cv4K3IjXTt0ufjkgKNKhAvNISPJn/tUKg7RG5L1EvmrEUC6Ze1kIgVHNlWTYBWXup1ojlzSZ2Eh5GI4rohzlkkwtQklUP8+aAmyry2F5rrp7yAcfPvAD6qXy/ccrKmog92IlU/tjthKWBYi+mOovpF0LvShWvg/xhueWHO8eJNlUgsr2uGH0WgfAatqEEbyCAFFR1go7k/7DdMnKfq0fScHW3jaLyjjwWoF1yK93tET4J99evc8dyBchDJcBtplmkBigAfFPOkDF1ZyMgfXSO+JldsKYFllISf+KU/Vy7yXWRpiuLEZu1qgLUyxNeRsTbVHt4CwPcBt1KoxP5PeUAi5sKdU41tN+2gv+07M7XA36BGYgPNWO7pworiYmqs8YohkJjLV0VVx1Q9NYT2V0LHwKvq8edoXkgd0t6/A8G1EY5ouscwGwrbpO24lGtD5cO8zvoUvQAyeNJAIuXcg5MVE
X-Forefront-Antispam-Report: 
	CIP:194.138.21.76;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199021)(40470700004)(46966006)(36840700001)(41300700001)(5660300002)(66899021)(44832011)(8676002)(30864003)(8936002)(40460700003)(2906002)(82310400005)(36756003)(40480700001)(86362001)(107886003)(1076003)(26005)(54906003)(16526019)(186003)(478600001)(47076005)(966005)(6666004)(45080400002)(81166007)(70206006)(70586007)(6916009)(4326008)(36860700001)(356005)(316002)(82960400001)(2616005)(956004)(82740400003)(83380400001)(336012)(36900700001)(579004)(559001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 12:00:33.2291
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 551cd0d6-81ce-4439-c820-08db73184853
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.76];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT083.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB7560
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 12:00:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183240

From: Andrej Valek <andrej.valek@siemens.com>

- Try to add convert and apply statuses for old CVEs
- Drop some obsolete ignores, while they are not relevant for current
  version

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Reviewed-by: Peter Marko <peter.marko@siemens.com>
---
 .../distro/include/cve-extra-exclusions.inc   | 371 +++++++++---------
 meta/recipes-bsp/grub/grub2.inc               |   6 +-
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   3 +-
 .../recipes-connectivity/bind/bind_9.18.15.bb |   2 +-
 .../bluez5/bluez5_5.66.bb                     |   4 +-
 .../openssh/openssh_9.3p1.bb                  |   9 +-
 .../openssl/openssl_3.1.1.bb                  |   3 +-
 meta/recipes-core/coreutils/coreutils_9.3.bb  |   4 +-
 meta/recipes-core/glibc/glibc_2.37.bb         |  17 +-
 meta/recipes-core/libxml/libxml2_2.10.4.bb    |   4 -
 meta/recipes-core/systemd/systemd_253.3.bb    |   3 -
 meta/recipes-devtools/cmake/cmake.inc         |   4 +-
 meta/recipes-devtools/flex/flex_2.6.4.bb      |   6 +-
 meta/recipes-devtools/gcc/gcc-13.1.inc        |   3 +-
 meta/recipes-devtools/git/git_2.39.3.bb       |   7 -
 meta/recipes-devtools/jquery/jquery_3.6.3.bb  |   5 +-
 meta/recipes-devtools/ninja/ninja_1.11.1.bb   |   3 +-
 .../recipes-devtools/python/python3_3.11.3.bb |  13 +-
 meta/recipes-devtools/qemu/qemu.inc           |  13 +-
 meta/recipes-devtools/rsync/rsync_3.2.7.bb    |   3 -
 meta/recipes-devtools/tcltk/tcl_8.6.13.bb     |   4 -
 meta/recipes-extended/cpio/cpio_2.14.bb       |   3 +-
 meta/recipes-extended/cups/cups.inc           |  17 +-
 .../ghostscript/ghostscript_10.01.1.bb        |   3 +-
 .../iputils/iputils_20221126.bb               |   5 +-
 .../libtirpc/libtirpc_1.3.3.bb                |   3 +-
 meta/recipes-extended/procps/procps_4.0.3.bb  |   4 -
 meta/recipes-extended/shadow/shadow_4.13.bb   |   7 +-
 meta/recipes-extended/unzip/unzip_6.0.bb      |   3 +-
 .../xinetd/xinetd_2.3.15.4.bb                 |   2 +-
 meta/recipes-extended/zip/zip_3.0.bb          |   7 +-
 .../libnotify/libnotify_0.8.2.bb              |   2 +-
 meta/recipes-gnome/librsvg/librsvg_2.56.0.bb  |   3 +-
 meta/recipes-graphics/builder/builder_0.1.bb  |   3 +-
 .../xorg-xserver/xserver-xorg.inc             |  19 +-
 .../linux/cve-exclusion_6.1.inc               |  11 +-
 .../libpng/libpng_1.6.39.bb                   |   3 +-
 meta/recipes-multimedia/libtiff/tiff_4.5.0.bb |  10 +-
 .../libgcrypt/libgcrypt_1.10.2.bb             |   4 +-
 .../recipes-support/libxslt/libxslt_1.1.38.bb |   4 +-
 meta/recipes-support/lz4/lz4_1.9.4.bb         |   3 +-
 meta/recipes-support/sqlite/sqlite3_3.41.2.bb |   7 -
 42 files changed, 257 insertions(+), 353 deletions(-)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/=
distro/include/cve-extra-exclusions.inc
index 1c3cc36c61..a5dd7d3866 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -16,43 +16,42 @@
 #
=20
=20
-# strace https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2000-0006
-# CVE is more than 20 years old with no resolution evident
-# broken links in CVE database references make resolution impractical
-CVE_CHECK_IGNORE +=3D "CVE-2000-0006"
-
-# epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2005-023=
8
-# The issue here is spoofing of domain names using characters from other c=
haracter sets.
-# There has been much discussion amongst the epiphany and webkit developer=
s and
-# whilst there are improvements about how domains are handled and displaye=
d to the user
-# there is unlikely ever to be a single fix to webkit or epiphany which ad=
dresses this
-# problem. Ignore this CVE as there isn't any mitigation or fix or way to =
progress this further
-# we can seem to take.
-CVE_CHECK_IGNORE +=3D "CVE-2005-0238"
-
-# glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2010-4756
-# Issue is memory exhaustion via glob() calls, e.g. from within an ftp ser=
ver
-# Best discussion in https://bugzilla.redhat.com/show_bug.cgi?id=3D681681
-# Upstream don't see it as a security issue, ftp servers shouldn't be pass=
ing
-# this to libc glob. Exclude as upstream have no plans to add BSD's GLOB_L=
IMIT or similar
-CVE_CHECK_IGNORE +=3D "CVE-2010-4756"
-
-# go https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-29509
-# go https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-29511
-# The encoding/xml package in go can potentially be used for security expl=
oits if not used correctly
-# CVE applies to a netapp product as well as flagging a general issue. We =
don't ship anything
-# exposing this interface in an exploitable way
-CVE_CHECK_IGNORE +=3D "CVE-2020-29509 CVE-2020-29511"
+# strace https://nvd.nist.gov/vuln/detail/CVE-2000-0006
+CVE_STATUS[CVE-2000-0006] =3D "upstream-wontfix: CVE is more than 20 years=
 old with no resolution evident. Broken links in CVE database references ma=
ke resolution impractical."
+
+# epiphany https://nvd.nist.gov/vuln/detail/CVE-2005-0238
+CVE_STATUS[CVE-2005-0238] =3D "upstream-wontfix: \
+The issue here is spoofing of domain names using characters from other cha=
racter sets. \
+There has been much discussion amongst the epiphany and webkit developers =
and \
+whilst there are improvements about how domains are handled and displayed =
to the user \
+there is unlikely ever to be a single fix to webkit or epiphany which addr=
esses this \
+problem. There isn't any mitigation or fix or way to progress this further=
."
+
+# glibc https://nvd.nist.gov/vuln/detail/CVE-2010-4756
+CVE_STATUS[CVE-2010-4756] =3D "upstream-wontfix: \
+Issue is memory exhaustion via glob() calls, e.g. from within an ftp serve=
r \
+Best discussion in https://bugzilla.redhat.com/show_bug.cgi?id=3D681681 \
+Upstream don't see it as a security issue, ftp servers shouldn't be passin=
g \
+this to libc glob. Upstream have no plans to add BSD's GLOB_LIMIT or simil=
ar."
+
+# go https://nvd.nist.gov/vuln/detail/CVE-2020-29509
+# go https://nvd.nist.gov/vuln/detail/CVE-2020-29511
+CVE_STATUS_GROUPS +=3D "CVE_STATUS_GO"
+CVE_STATUS_GO =3D "CVE-2020-29509 CVE-2020-29511"
+CVE_STATUS_GO[status] =3D "not-applicable-config: \
+The encoding/xml package in go can potentially be used for security exploi=
ts if not used correctly \
+CVE applies to a netapp product as well as flagging a general issue. We do=
n't ship anything \
+exposing this interface in an exploitable way"
=20
 # db
-# Since Oracle relicensed bdb, the open source community is slowly but sur=
ely replacing bdb with
-# supported and open source friendly alternatives. As a result these CVEs =
are unlikely to ever be fixed.
-CVE_CHECK_IGNORE +=3D "CVE-2015-2583 CVE-2015-2624 CVE-2015-2626 CVE-2015-=
2640 CVE-2015-2654 \
+CVE_STATUS_GROUPS +=3D "CVE_STATUS_DB"
+CVE_STATUS_DB =3D "CVE-2015-2583 CVE-2015-2624 CVE-2015-2626 CVE-2015-2640=
 CVE-2015-2654 \
 CVE-2015-2656 CVE-2015-4754 CVE-2015-4764 CVE-2015-4774 CVE-2015-4775 CVE-=
2015-4776 CVE-2015-4777 \
 CVE-2015-4778 CVE-2015-4779 CVE-2015-4780 CVE-2015-4781 CVE-2015-4782 CVE-=
2015-4783 CVE-2015-4784 \
 CVE-2015-4785 CVE-2015-4786 CVE-2015-4787 CVE-2015-4788 CVE-2015-4789 CVE-=
2015-4790 CVE-2016-0682 \
 CVE-2016-0689 CVE-2016-0692 CVE-2016-0694 CVE-2016-3418 CVE-2020-2981"
-
+CVE_STATUS_DB[status] =3D "upstream-wontfix: Since Oracle relicensed bdb, =
the open source community is slowly but surely \
+replacing bdb with supported and open source friendly alternatives. As a r=
esult this CVE is unlikely to ever be fixed."
=20
 #
 # Kernel CVEs, e.g. linux-yocto*
@@ -65,74 +64,83 @@ CVE-2016-0689 CVE-2016-0692 CVE-2016-0694 CVE-2016-3418=
 CVE-2020-2981"
 # issues to be visible. If anyone wishes to clean up CPE entries with NIST=
 for these, we'd
 # welcome than and then entries can likely be removed from here.
 #
+
+CVE_STATUS_GROUPS +=3D "CVE_STATUS_KERNEL_2010 CVE_STATUS_KERNEL_2017 CVE_=
STATUS_KERNEL_2018 CVE_STATUS_KERNEL_2020"
+
 # 1999-2010
-CVE_CHECK_IGNORE +=3D "CVE-1999-0524 CVE-1999-0656 CVE-2006-2932 CVE-2007-=
2764 CVE-2007-4998 CVE-2008-2544 \
-                     CVE-2008-4609 CVE-2010-0298 CVE-2010-4563"
+CVE_STATUS_KERNEL_2010 =3D "CVE-1999-0524 CVE-1999-0656 CVE-2006-2932 CVE-=
2007-2764 CVE-2007-4998 CVE-2008-2544 \
+                          CVE-2008-4609 CVE-2010-0298 CVE-2010-4563"
+CVE_STATUS_KERNEL_2010[status] =3D "ignored"
+
 # 2011-2017
-CVE_CHECK_IGNORE +=3D "CVE-2011-0640 CVE-2014-2648 CVE-2014-8171 CVE-2016-=
0774 CVE-2016-3695 CVE-2016-3699 \
-                     CVE-2017-1000255 CVE-2017-1000377 CVE-2017-5897 CVE-2=
017-6264"
+CVE_STATUS_KERNEL_2017 =3D "CVE-2011-0640 CVE-2014-2648 CVE-2014-8171 CVE-=
2016-0774 CVE-2016-3695 CVE-2016-3699 \
+                          CVE-2017-1000255 CVE-2017-1000377 CVE-2017-5897 =
CVE-2017-6264"
+CVE_STATUS_KERNEL_2017[status] =3D "ignored"
+
 # 2018
-CVE_CHECK_IGNORE +=3D "CVE-2018-1000026 CVE-2018-10840 CVE-2018-10876 CVE-=
2018-10882 CVE-2018-10901 CVE-2018-10902 \
-                     CVE-2018-14625 CVE-2018-16880 CVE-2018-16884 CVE-2018=
-5873"
+CVE_STATUS_KERNEL_2018 =3D "CVE-2018-1000026 CVE-2018-10840 CVE-2018-10876=
 CVE-2018-10882 CVE-2018-10901 CVE-2018-10902 \
+                           CVE-2018-14625 CVE-2018-16880 CVE-2018-16884 CV=
E-2018-5873"
+CVE_STATUS_KERNEL_2018[status] =3D "ignored"
=20
-# This is specific to Ubuntu
-CVE_CHECK_IGNORE +=3D "CVE-2018-6559"
+CVE_STATUS[CVE-2018-6559] =3D "not-applicable-platform: This is specific t=
o Ubuntu"
=20
 # https://www.linuxkernelcves.com/cves/CVE-2019-3016
-# Fixed with 5.6
-CVE_CHECK_IGNORE +=3D "CVE-2019-3016"
+CVE_STATUS[CVE-2019-3016] =3D "fixed-version: Fixed in version v5.6"
=20
 # https://www.linuxkernelcves.com/cves/CVE-2019-3819
-# Fixed with 5.1
-CVE_CHECK_IGNORE +=3D "CVE-2019-3819"
+CVE_STATUS[CVE-2019-3819] =3D "fixed-version: Fixed in version v5.1"
=20
 # https://www.linuxkernelcves.com/cves/CVE-2019-3887
-# Fixed with 5.2
-CVE_CHECK_IGNORE +=3D "CVE-2019-3887"
+CVE_STATUS[CVE-2019-3887] =3D "fixed-version: Fixed in version v5.2"
=20
 # 2020
-CVE_CHECK_IGNORE +=3D "CVE-2020-10732 CVE-2020-10742 CVE-2020-16119 CVE-20=
20-1749 CVE-2020-25672 CVE-2020-27820 CVE-2020-35501 CVE-2020-8834"
+CVE_STATUS_KERNEL_2020 =3D "CVE-2020-10732 CVE-2020-10742 CVE-2020-16119 C=
VE-2020-1749 CVE-2020-25672 CVE-2020-27820 CVE-2020-35501 CVE-2020-8834"
+CVE_STATUS_KERNEL_2020[status] =3D "ignored"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2020-27784
 # Introduced in version v4.1 b26394bd567e5ebe57ec4dee7fe6cd14023c96e9
 #=C2=A0Patched in kernel since v5.10	e8d5f92b8d30bb4ade76494490c3c065e1241=
1b1
 # Backported in version v5.4.73	e9e791f5c39ab30e374a3b1a9c25ca7ff24988f3
-CVE_CHECK_IGNORE +=3D "CVE-2020-27784"
+CVE_STATUS[CVE-2020-27784] =3D "fixed-version: Fixed in versions v5.10"
=20
 # 2021
-CVE_CHECK_IGNORE +=3D "CVE-2021-20194 CVE-2021-20226 CVE-2021-20265 CVE-20=
21-3564 CVE-2021-3743 CVE-2021-3847 CVE-2021-4002 \
-                     CVE-2021-4090 CVE-2021-4095 CVE-2021-4197 CVE-2021-42=
02 CVE-2021-44879 CVE-2021-45402"
+CVE_STATUS_GROUPS +=3D "CVE_STATUS_KERNEL_2021"
+CVE_STATUS_KERNEL_2021 =3D "CVE-2021-20194 CVE-2021-20226 CVE-2021-20265 C=
VE-2021-3564 CVE-2021-3743 CVE-2021-3847 CVE-2021-4002 \
+                          CVE-2021-4090 CVE-2021-4095 CVE-2021-4197 CVE-20=
21-4202 CVE-2021-44879 CVE-2021-45402"
+CVE_STATUS_KERNEL_2021[status] =3D "ignored"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2021-3669
 # Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
 # Patched in kernel since v5.15 20401d1058f3f841f35a594ac2fc1293710e55b9
-CVE_CHECK_IGNORE +=3D "CVE-2021-3669"
+CVE_STATUS[CVE-2021-3669] =3D "fixed-version: Fixed in version v5.15"
=20
 #=C2=A0https://nvd.nist.gov/vuln/detail/CVE-2021-3759
 # Introduced in version v4.5 a9bb7e620efdfd29b6d1c238041173e411670996
 #=C2=A0Patched in kernel since v5.15 18319498fdd4cdf8c1c2c48cd432863b1f915=
d6f
 # Backported in version v5.4.224 bad83d55134e647a739ebef2082541963f2cbc92
 # Backported in version v5.10.154 836686e1a01d7e2fda6a5a18252243ff30a6e196
-CVE_CHECK_IGNORE +=3D "CVE-2021-3759"
+CVE_STATUS[CVE-2021-3759] =3D "fixed-version: Fixed in version v5.15"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2021-4218
 # Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
 # Patched in kernel since v5.8 32927393dc1ccd60fb2bdc05b9e8e88753761469
-CVE_CHECK_IGNORE +=3D "CVE-2021-4218"
+CVE_STATUS[CVE-2021-4218] =3D "fixed-version: Fixed in version v5.8"
=20
 # 2022
-CVE_CHECK_IGNORE +=3D "CVE-2022-0185 CVE-2022-0264 CVE-2022-0286 CVE-2022-=
0330 CVE-2022-0382 CVE-2022-0433 CVE-2022-0435 \
-                     CVE-2022-0492 CVE-2022-0494 CVE-2022-0500 CVE-2022-05=
16 CVE-2022-0617 CVE-2022-0742 CVE-2022-0854 \
-                     CVE-2022-0995 CVE-2022-0998 CVE-2022-1011 CVE-2022-10=
15 CVE-2022-1048 CVE-2022-1055 CVE-2022-1195 \
-                     CVE-2022-1353 CVE-2022-24122 CVE-2022-24448 CVE-2022-=
24958 CVE-2022-24959 CVE-2022-25258 CVE-2022-25265 \
-                     CVE-2022-25375 CVE-2022-26490 CVE-2022-26878 CVE-2022=
-26966 CVE-2022-27223 CVE-2022-27666 CVE-2022-27950 \
-                     CVE-2022-28356 CVE-2022-28388 CVE-2022-28389 CVE-2022=
-28390 CVE-2022-28796 CVE-2022-28893 CVE-2022-29156 \
-                     CVE-2022-29582 CVE-2022-29968"
+CVE_STATUS_GROUPS +=3D "CVE_STATUS_KERNEL_2022"
+CVE_STATUS_KERNEL_2022 =3D "CVE-2022-0185 CVE-2022-0264 CVE-2022-0286 CVE-=
2022-0330 CVE-2022-0382 CVE-2022-0433 CVE-2022-0435 \
+                          CVE-2022-0492 CVE-2022-0494 CVE-2022-0500 CVE-20=
22-0516 CVE-2022-0617 CVE-2022-0742 CVE-2022-0854 \
+                          CVE-2022-0995 CVE-2022-0998 CVE-2022-1011 CVE-20=
22-1015 CVE-2022-1048 CVE-2022-1055 CVE-2022-1195 \
+                          CVE-2022-1353 CVE-2022-24122 CVE-2022-24448 CVE-=
2022-24958 CVE-2022-24959 CVE-2022-25258 CVE-2022-25265 \
+                          CVE-2022-25375 CVE-2022-26490 CVE-2022-26878 CVE=
-2022-26966 CVE-2022-27223 CVE-2022-27666 CVE-2022-27950 \
+                          CVE-2022-28356 CVE-2022-28388 CVE-2022-28389 CVE=
-2022-28390 CVE-2022-28796 CVE-2022-28893 CVE-2022-29156 \
+                          CVE-2022-29582 CVE-2022-29968"
+CVE_STATUS_KERNEL_2022[status] =3D "ignored"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2022-0480
 # Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
 # Patched in kernel since v5.15 0f12156dff2862ac54235fc72703f18770769042
-CVE_CHECK_IGNORE +=3D "CVE-2022-0480"
+CVE_STATUS[CVE-2022-0480] =3D "fixed-version: Fixed in version v5.15"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2022-1184
 # Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
@@ -140,7 +148,7 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-0480"
 # Backported in version v5.4.198 17034d45ec443fb0e3c0e7297f9cd10f70446064
 # Backported in version v5.10.121 da2f05919238c7bdc6e28c79539f55c8355408bb
 # Backported in version v5.15.46 ca17db384762be0ec38373a12460081d22a8b42d
-CVE_CHECK_IGNORE +=3D "CVE-2022-1184"
+CVE_STATUS[CVE-2022-1184] =3D "fixed-version: Fixed in version v5.19"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2022-1462
 # Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
@@ -148,7 +156,7 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-1184"
 # Backported in version v5.4.208 f7785092cb7f022f59ebdaa181651f7c877df132
 # Backported in version v5.10.134 08afa87f58d83dfe040572ed591b47e8cb9e225c
 # Backported in version v5.15.58 b2d1e4cd558cffec6bfe318f5d74e6cffc374d29
-CVE_CHECK_IGNORE +=3D "CVE-2022-1462"
+CVE_STATUS[CVE-2022-1462] =3D "fixed-version: Fixed in version v5.19"
=20
 #=C2=A0https://nvd.nist.gov/vuln/detail/CVE-2022-2196
 # Introduced in version v5.8 5c911beff20aa8639e7a1f28988736c13e03ed54
@@ -158,19 +166,19 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-1462"
 # Backported in version v5.10.170 1b0cafaae8884726c597caded50af185ffc13349
 # Backported in version v5.15.96 6b539a7dbb49250f92515c2ba60aea239efc9e35
 # Backported in version v6.1.14 63fada296062e91ad9f871970d4e7f19e21a6a15
-CVE_CHECK_IGNORE +=3D "CVE-2022-2196"
+CVE_STATUS[CVE-2022-2196] =3D "cpe-stable-backport: Backported in versions=
 v5.4.233, v5.10.170, v5.15.96 and v6.1.14"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2022-2308
 # Introduced in version v5.15 c8a6153b6c59d95c0e091f053f6f180952ade91e
 # Patched in kernel since v6.0 46f8a29272e51b6df7393d58fc5cb8967397ef2b
 # Backported in version v5.15.72 dc248ddf41eab4566e95b1ee2433c8a5134ad94a
 # Backported in version v5.19.14 38d854c4a11c3bbf6a96ea46f14b282670c784ac
-CVE_CHECK_IGNORE +=3D "CVE-2022-2308"
+CVE_STATUS[CVE-2022-2308] =3D "fixed-version: Fixed in version v6.0"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2022-2327
 # Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
 # Patched in kernel since v5.10.125 df3f3bb5059d20ef094d6b2f0256c4bf4127a8=
59
-CVE_CHECK_IGNORE +=3D "CVE-2022-2327"
+CVE_STATUS[CVE-2022-2327] =3D "fixed-version: Fixed in version v5.10.125"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2022-2663
 # Introduced in version v2.6.20 869f37d8e48f3911eb70f38a994feaa8f8380008
@@ -179,19 +187,19 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-2327"
 # Backported in version v5.10.143 e12ce30fe593dd438c5b392290ad7316befc11ca
 # Backported in version v5.15.68 451c9ce1e2fc9b9e40303bef8e5a0dca1a923cc4
 # Backported in version v5.19.9 6cf0609154b2ce8d3ae160e7506ab316400a8d3d
-CVE_CHECK_IGNORE +=3D "CVE-2022-2663"
+CVE_STATUS[CVE-2022-2663] =3D "fixed-version: Fixed in version v6.0"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2022-2785
 # Introduced in version v5.18 b1d18a7574d0df5eb4117c14742baf8bc2b9bb74
 # Patched in kernel since v6.0 86f44fcec22ce2979507742bc53db8400e454f46
 # Backported in version v5.19.4 b429d0b9a7a0f3dddb1f782b72629e6353f292fd
-CVE_CHECK_IGNORE +=3D "CVE-2022-2785"
+CVE_STATUS[CVE-2022-2785] =3D "fixed-version: Fixed in version v6.0"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2022-3176
 # Introduced in version v5.1 221c5eb2338232f7340386de1c43decc32682e58
 # Patched in kernel since v5.17 791f3465c4afde02d7f16cf7424ca87070b69396
 # Backported in version v5.15.65 e9d7ca0c4640cbebe6840ee3bac66a25a9bacaf5
-CVE_CHECK_IGNORE +=3D "CVE-2022-3176"
+CVE_STATUS[CVE-2022-3176] =3D "fixed-version: Fixed in version v5.17"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2022-3424
 # Introduced in version v2.6.33 55484c45dbeca2eec7642932ec3f60f8a2d4bdbf
@@ -200,7 +208,7 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-3176"
 # Backported in version v5.10.163 0f67ed565f20ea2fdd98e3b0b0169d9e580bb83c
 # Backported in version v5.15.86 d5c8f9003a289ee2a9b564d109e021fc4d05d106
 # Backported in version v6.1.2 4e947fc71bec7c7da791f8562d5da233b235ba5e
-CVE_CHECK_IGNORE +=3D "CVE-2022-3424"
+CVE_STATUS[CVE-2022-3424] =3D "cpe-stable-backport: Backported in versions=
 v5.4.229, v5.10.163, v5.15.86 and v6.1.2"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2022-3435
 # Introduced in version v5.18 6bf92d70e690b7ff12b24f4bfff5e5434d019b82
@@ -211,13 +219,13 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-3424"
 # Backported in version v5.4.226 cc3cd130ecfb8b0ae52e235e487bae3f16a24a32
 # Backported in version v5.10.158 0b5394229ebae09afc07aabccb5ffd705ffd250e
 # Backported in version v5.15.82 25174d91e4a32a24204060d283bd5fa6d0ddf133
-CVE_CHECK_IGNORE +=3D "CVE-2022-3435"
+CVE_STATUS[CVE-2022-3435] =3D "fixed-version: Fixed in version v6.1"
=20
 #=C2=A0https://nvd.nist.gov/vuln/detail/CVE-2022-3526
 # Introduced in version v5.13 427f0c8c194b22edcafef1b0a42995ddc5c2227d
 # Patched in kernel since v5.18 e16b859872b87650bb55b12cca5a5fcdc49c1442
 # Backported in version v5.15.35 8f79ce226ad2e9b2ec598de2b9560863b7549d1b
-CVE_CHECK_IGNORE +=3D "CVE-2022-3526"
+CVE_STATUS[CVE-2022-3526] =3D "fixed-version: Fixed in version v5.18"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2022-3534
 #=C2=A0Introduced in version v5.10 919d2b1dbb074d438027135ba644411931179a5=
9
@@ -225,20 +233,20 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-3526"
 # Backported in version v5.10.163 c61650b869e0b6fb0c0a28ed42d928eea969afc8
 # Backported in version v5.15.86 a733bf10198eb5bb927890940de8ab457491ed3b
 # Backported in version v6.1.2 fbe08093fb2334549859829ef81d42570812597d
-CVE_CHECK_IGNORE +=3D "CVE-2022-3534"
+CVE_STATUS[CVE-2022-3534] =3D "cpe-stable-backport: Backported in versions=
 v5.10.163, v5.15.86 and v6.1.2"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2022-3564
 #=C2=A0Introduced in version v3.6 4b51dae96731c9d82f5634e75ac7ffd3b9c1b060
 # Patched in kernel since v6.1 3aff8aaca4e36dc8b17eaa011684881a80238966
 # Backported in version v5.10.154 cb1c012099ef5904cd468bdb8d6fcdfdd9bcb569
 # Backported in version v5.15.78 8278a87bb1eeea94350d675ef961ee5a03341fde
-CVE_CHECK_IGNORE +=3D "CVE-2022-3564"
+CVE_STATUS[CVE-2022-3564] =3D "fixed-version: Fixed in version v6.1"
=20
 #=C2=A0https://nvd.nist.gov/vuln/detail/CVE-2022-3619
 # Introduced in version v5.12 4d7ea8ee90e42fc75995f6fb24032d3233314528
 # Patched in kernel since v6.1 7c9524d929648935bac2bbb4c20437df8f9c3f42
 # Backported in version v5.15.78 aa16cac06b752e5f609c106735bd7838f444784c
-CVE_CHECK_IGNORE +=3D "CVE-2022-3619"
+CVE_STATUS[CVE-2022-3619] =3D "fixed-version: Fixed in version v6.1"
=20
 #=C2=A0https://nvd.nist.gov/vuln/detail/CVE-2022-3621
 # Introduced in version v2.60.30 05fe58fdc10df9ebea04c0eaed57adc47af5c184
@@ -247,7 +255,7 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-3619"
 # Backported in version v5.10.148 3f840480e31495ce674db4a69912882b5ac083f2
 # Backported in version v5.15.74 1e512c65b4adcdbdf7aead052f2162b079cc7f55
 # Backported in version v5.19.16 caf2c6b580433b3d3e413a3d54b8414a94725dcd
-CVE_CHECK_IGNORE +=3D "CVE-2022-3621"
+CVE_STATUS[CVE-2022-3621] =3D "fixed-version: Fixed in version v6.1"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2022-3623
 # Introduced in version v5.1 5480280d3f2d11d47f9be59d49b20a8d7d1b33e8
@@ -256,12 +264,12 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-3621"
 # Backported in version v5.10.159 fccee93eb20d72f5390432ecea7f8c16af88c850
 # Backported in version v5.15.78 3a44ae4afaa5318baed3c6e2959f24454e0ae4ff
 # Backported in version v5.19.17 86a913d55c89dd13ba070a87f61a493563e94b54
-CVE_CHECK_IGNORE +=3D "CVE-2022-3623"
+CVE_STATUS[CVE-2022-3623] =3D "fixed-version: Fixed in version v6.1"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2022-3624
 # Introduced in version v6.0 d5410ac7b0baeca91cf73ff5241d35998ecc8c9e
 # Patched in kernel since v6.0 4f5d33f4f798b1c6d92b613f0087f639d9836971
-CVE_CHECK_IGNORE +=3D "CVE-2022-3624"
+CVE_STATUS[CVE-2022-3624] =3D "fixed-version: Fixed in version v6.0"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2022-3625
 # Introduced in version v4.19 45f05def5c44c806f094709f1c9b03dcecdd54f0
@@ -270,7 +278,7 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-3624"
 # Backported in version v5.10.138 0e28678a770df7989108327cfe86f835d8760c33
 # Backported in version v5.15.63 c4d09fd1e18bac11c2f7cf736048112568687301
 # Backported in version v5.19.4 26bef5616255066268c0e40e1da10cc9b78b82e9
-CVE_CHECK_IGNORE +=3D "CVE-2022-3625"
+CVE_STATUS[CVE-2022-3625] =3D "fixed-version: Fixed in version v6.0"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2022-3629
 # Introduced in version v3.9 d021c344051af91f42c5ba9fdedc176740cbd238
@@ -279,13 +287,13 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-3625"
 # Backported in version v5.10.138 38ddccbda5e8b762c8ee06670bb1f64f1be5ee50
 # Backported in version v5.15.63 e4c0428f8a6fc8c218d7fd72bddd163f05b29795
 # Backported in version v5.19.4 8ff5db3c1b3d6797eda5cd326dcd31b9cd1c5f72
-CVE_CHECK_IGNORE +=3D "CVE-2022-3629"
+CVE_STATUS[CVE-2022-3629] =3D "fixed-version: Fixed in version v6.0"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2022-3630
 # Introduced in version v5.19 85e4ea1049c70fb99de5c6057e835d151fb647da
 # Patched in kernel since v6.0 fb24771faf72a2fd62b3b6287af3c610c3ec9cf1
 # Backported in version v5.19.4 7a369dc87b66acc85d0cffcf39984344a203e20b
-CVE_CHECK_IGNORE +=3D "CVE-2022-3630"
+CVE_STATUS[CVE-2022-3630] =3D "fixed-version: Fixed in version v6.0"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2022-3633
 # Introduced in version v5.4 9d71dd0c70099914fcd063135da3c580865e924c
@@ -294,7 +302,7 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-3630"
 # Backported in version v5.10.138 a220ff343396bae8d3b6abee72ab51f1f34b3027
 # Backported in version v5.15.63 98dc8fb08299ab49e0b9c08daedadd2f4de1a2f2
 # Backported in version v5.19.4 a0278dbeaaf7ca60346c62a9add65ae7d62564de
-CVE_CHECK_IGNORE +=3D "CVE-2022-3633"
+CVE_STATUS[CVE-2022-3633] =3D "fixed-version: Fixed in version v6.0"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2022-3635
 # Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
@@ -303,12 +311,12 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-3633"
 # Backported in version v5.10.138 a0ae122e9aeccbff75014c4d36d11a9d32e7fb5e
 # Backported in version v5.15.63 a5d7ce086fe942c5ab422fd2c034968a152be4c4
 # Backported in version v5.19.4 af412b252550f9ac36d9add7b013c2a2c3463835
-CVE_CHECK_IGNORE +=3D "CVE-2022-3635"
+CVE_STATUS[CVE-2022-3635] =3D "fixed-version: Fixed in version v6.0"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2022-3636
 # Introduced in version v5.19 33fc42de33278b2b3ec6f3390512987bc29a62b7
 # Patched in kernel since v5.19 17a5f6a78dc7b8db385de346092d7d9f9dc24df6
-CVE_CHECK_IGNORE +=3D "CVE-2022-3636"
+CVE_STATUS[CVE-2022-3636] =3D "fixed-version: Fixed in version v5.19"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2022-3640
 # Introduced in version v5.19 d0be8347c623e0ac4202a1d4e0373882821f56b0
@@ -319,7 +327,7 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-3636"
 # Backported in version v5.4.224 c1f594dddd9ffd747c39f49cc5b67a9b7677d2ab
 # Backported in version v5.10.154 d9ec6e2fbd4a565b2345d4852f586b7ae3ab41fd
 # Backported in version v5.15.78 a3a7b2ac64de232edb67279e804932cb42f0b52a
-CVE_CHECK_IGNORE +=3D "CVE-2022-3640"
+CVE_STATUS[CVE-2022-3640] =3D "fixed-version: Fixed in version v6.1"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2022-3646
 # Introduced in version v2.6.30 9ff05123e3bfbb1d2b68ba1d9bf1f7d1dffc1453
@@ -328,7 +336,7 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-3640"
 # Backported in version v5.10.148 aad4c997857f1d4b6c1e296c07e4729d3f8058ee
 # Backported in version v5.15.74 44b1ee304bac03f1b879be5afe920e3a844e40fc
 # Backported in version v5.19.16 4755fcd844240857b525f6e8d8b65ee140fe9570
-CVE_CHECK_IGNORE +=3D "CVE-2022-3646"
+CVE_STATUS[CVE-2022-3646] =3D "fixed-version: Fixed in version v6.1"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2022-3649
 # Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
@@ -337,7 +345,7 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-3646"
 # Backported in version v5.10.148 21ee3cffed8fbabb669435facfd576ba18ac8652
 # Backported in version v5.15.74 cb602c2b654e26763226d8bd27a702f79cff4006
 # Backported in version v5.19.16 394b2571e9a74ddaed55aa9c4d0f5772f81c21e4
-CVE_CHECK_IGNORE +=3D "CVE-2022-3649"
+CVE_STATUS[CVE-2022-3649] =3D "fixed-version: Fixed in version v6.1"
=20
 #=C2=A0https://nvd.nist.gov/vuln/detail/CVE-2022-4382
 # Introduced in version v5.3 e5d82a7360d124ae1a38c2a5eac92ba49b125191
@@ -346,7 +354,7 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-3649"
 # Backported in version v5.10.165 856e4b5e53f21edbd15d275dde62228dd94fb2b4
 # Backported in version v5.15.90 a2e075f40122d8daf587db126c562a67abd69cf9
 # Backported in version v6.1.8 616fd34d017000ecf9097368b13d8a266f4920b3
-CVE_CHECK_IGNORE +=3D "CVE-2022-4382"
+CVE_STATUS[CVE-2022-4382] =3D "cpe-stable-backport: Backported in versions=
 v5.4.230, v5.10.165, v5.15.90 and v6.1.8"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2022-26365
 # Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
@@ -354,7 +362,7 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-4382"
 # Backported in version v5.4.204 42112e8f94617d83943f8f3b8de2b66041905506
 # Backported in version v5.10.129 cfea428030be836d79a7690968232bb7fa4410f1
 # Backported in version v5.15.53 7ed65a4ad8fa9f40bc3979b32c54243d6a684ec9
-CVE_CHECK_IGNORE +=3D "CVE-2022-26365"
+CVE_STATUS[CVE-2022-26365] =3D "fixed-version: Fixed in version v5.19"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2022-33740
 # Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
@@ -362,7 +370,7 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-26365"
 # Backported in version v5.4.204 04945b5beb73019145ac17a2565526afa7293c14
 # Backported in version v5.10.129 728d68bfe68d92eae1407b8a9edc7817d6227404
 # Backported in version v5.15.53 5dd0993c36832d33820238fc8dc741ba801b7961
-CVE_CHECK_IGNORE +=3D "CVE-2022-33740"
+CVE_STATUS[CVE-2022-33740] =3D "fixed-version: Fixed in version v5.19"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2022-33741
 # Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
@@ -370,7 +378,7 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-33740"
 # Backported in version v5.4.204 ede57be88a5fff42cd00e6bcd071503194d398dd
 # Backported in version v5.10.129 4923217af5742a796821272ee03f8d6de15c0cca
 # Backported in version v5.15.53 ed3cfc690675d852c3416aedb271e0e7d179bf49
-CVE_CHECK_IGNORE +=3D "CVE-2022-33741"
+CVE_STATUS[CVE-2022-33741] =3D "fixed-version: Fixed in version v5.19"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2022-33742
 # Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
@@ -378,15 +386,15 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-33741"
 # Backported in version v5.4.204 60ac50daad36ef3fe9d70d89cfe3b95d381db997
 # Backported in version v5.10.129 cbbd2d2531539212ff090aecbea9877c996e6ce6
 # Backported in version v5.15.53 6d0a9127279a4533815202e30ad1b3a39f560ba3
-CVE_CHECK_IGNORE +=3D "CVE-2022-33742"
+CVE_STATUS[CVE-2022-33742] =3D "fixed-version: Fixed in version v5.19"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2022-42895
 # Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
 # Patched in kernel since v6.1 b1a2cd50c0357f243b7435a732b4e62ba3157a2e
-# Backported in version v5.15.78 3e4697ffdfbb38a2755012c4e571546c89ab6422
-# Backported in version v5.10.154 26ca2ac091b49281d73df86111d16e5a76e43bd7
 # Backported in version v5.4.224 6949400ec9feca7f88c0f6ca5cb5fdbcef419c89
-CVE_CHECK_IGNORE +=3D "CVE-2022-42895"
+# Backported in version v5.10.154 26ca2ac091b49281d73df86111d16e5a76e43bd7
+# Backported in version v5.15.78 3e4697ffdfbb38a2755012c4e571546c89ab6422
+CVE_STATUS[CVE-2022-42895] =3D "fixed-version: Fixed in version v6.1"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2022-42896
 # Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
@@ -394,7 +402,7 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-42895"
 # Backported in version v5.4.226 0d87bb6070361e5d1d9cb391ba7ee73413bc109b
 # Backported in version v5.10.154 6b6f94fb9a74dd2891f11de4e638c6202bc89476
 # Backported in version v5.15.78 81035e1201e26d57d9733ac59140a3e29befbc5a
-CVE_CHECK_IGNORE +=3D "CVE-2022-42896"
+CVE_STATUS[CVE-2022-42896] =3D "fixed-version: Fixed in version v6.1"
=20
=20
 # 2023
@@ -404,14 +412,14 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-42896"
 # Backported in version v5.10.164 550efeff989b041f3746118c0ddd863c39ddc1aa
 # Backported in version v5.15.89 a8acfe2c6fb99f9375a9325807a179cd8c32e6e3
 # Backported in version v6.1.7 76ef74d4a379faa451003621a84e3498044e7aa3
-CVE_CHECK_IGNORE +=3D "CVE-2023-0179"
+CVE_STATUS[CVE-2023-0179] =3D "cpe-stable-backport: Backported in versions=
 v5.10.164, v5.15.89 and v6.1.7"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2023-0266
 # Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
 # Patched in kernel since v6.2 56b88b50565cd8b946a2d00b0c83927b7ebb055e
 # Backported in version v5.15.88 26350c21bc5e97a805af878e092eb8125843fe2c
 # Backported in version v6.1.6 d6ad4bd1d896ae1daffd7628cd50f124280fb8b1
-CVE_CHECK_IGNORE +=3D "CVE-2023-0266"
+CVE_STATUS[CVE-2023-0266] =3D "cpe-stable-backport: Backported in versions=
 v5.15.88 and v6.1.6"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2023-0394
 # Introduced in version 2.6.12 357b40a18b04c699da1d45608436e9b76b50e251
@@ -420,7 +428,7 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-0266"
 # Backported in version v5.10.164 6c9e2c11c33c35563d34d12b343d43b5c12200b5
 # Backported in version v5.15.89 456e3794e08a0b59b259da666e31d0884b376bcf
 # Backported in version v6.1.7 0afa5f0736584411771299074bbeca8c1f9706d4
-CVE_CHECK_IGNORE +=3D "CVE-2023-0394"
+CVE_STATUS[CVE-2023-0394] =3D "cpe-stable-backport: Backported in versions=
 v5.4.229, v5.10.164, v5.15.89 and v6.1.7"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2023-0461
 # Introduced in version v4.13 734942cc4ea6478eed125af258da1bdbb4afe578
@@ -429,28 +437,28 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-0394"
 # Backported in version v5.10.163 f8ed0a93b5d576bbaf01639ad816473bdfd1dcb0
 # Backported in version v5.15.88 dadd0dcaa67d27f550131de95c8e182643d2c9d6
 # Backported in version v6.1.5 7d242f4a0c8319821548c7176c09a6e0e71f223c
-CVE_CHECK_IGNORE +=3D "CVE-2023-0461"
+CVE_STATUS[CVE-2023-0461] =3D "cpe-stable-backport: Backported in versions=
 v5.4.229, v5.10.163, v5.15.88 and v6.1.5"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2023-0386
 # Introduced in 5.11 459c7c565ac36ba09ffbf24231147f408fde4203
 # Patched in kernel v6.2 4f11ada10d0ad3fd53e2bd67806351de63a4f9c3
-# Backported in version 6.1.9 42fea1c35254c49cce07c600d026cbc00c6d3c81
-# Backported in version 5.15.91 e91308e63710574c4b6a0cadda3e042a3699666e
-CVE_CHECK_IGNORE +=3D "CVE-2023-0386"
+# Backported in version v5.15.91 e91308e63710574c4b6a0cadda3e042a3699666e
+# Backported in version v6.1.9 42fea1c35254c49cce07c600d026cbc00c6d3c81
+CVE_STATUS[CVE-2023-0386] =3D "cpe-stable-backport: Backported in versions=
 v5.15.91 and v6.1.9"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2023-1073
 # Introduced in v3.16 1b15d2e5b8077670b1e6a33250a0d9577efff4a5
 # Patched in kernel v6.2 b12fece4c64857e5fab4290bf01b2e0317a88456
-# Backported in version 5.10.166 5dc3469a1170dd1344d262a332b26994214eeb58
-# Backported in version 5.15.91 2b49568254365c9c247beb0eabbaa15d0e279d64
-# Backported in version 6.1.9 cdcdc0531a51659527fea4b4d064af343452062d
-CVE_CHECK_IGNORE +=3D "CVE-2023-1073"
+# Backported in version v5.10.166 5dc3469a1170dd1344d262a332b26994214eeb58
+# Backported in version v5.15.91 2b49568254365c9c247beb0eabbaa15d0e279d64
+# Backported in version v6.1.9 cdcdc0531a51659527fea4b4d064af343452062d
+CVE_STATUS[CVE-2023-1073] =3D "cpe-stable-backport: Backported in versions=
 v5.10.166, v5.15.91 and v6.1.9"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2023-1074
 # Patched in kernel v6.2 458e279f861d3f61796894cd158b780765a1569f
-# Backported in version 5.15.91 3391bd42351be0beb14f438c7556912b9f96cb32
-# Backported in version 6.1.9 9f08bb650078dca24a13fea1c375358ed6292df3
-CVE_CHECK_IGNORE +=3D "CVE-2023-1074"
+# Backported in version v5.15.91 3391bd42351be0beb14f438c7556912b9f96cb32
+# Backported in version v6.1.9 9f08bb650078dca24a13fea1c375358ed6292df3
+CVE_STATUS[CVE-2023-1074] =3D "cpe-stable-backport: Backported in versions=
 v5.15.91 and v6.1.9"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2023-1076
 # Patched in kernel v6.3 a096ccca6e503a5c575717ff8a36ace27510ab0a
@@ -459,19 +467,19 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-1074"
 # Backported in version v5.15.99 67f9f02928a34aad0a2c11dab5eea269f5ecf427
 # Backported in version v6.1.16 b4ada752eaf1341f47bfa3d8ada377eca75a8d44
 # Backported in version v6.2.3 4aa4b4b3b3e9551c4de2bf2987247c28805fb8f6
-CVE_CHECK_IGNORE +=3D "CVE-2023-1076"
+CVE_STATUS[CVE-2023-1076] =3D "cpe-stable-backport: Backported in versions=
 v5.4.235, v5.10.173, v5.15.99, v6.1.16 and v6.2.3"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2023-1077
 # Patched in kernel 6.3rc1 7c4a5b89a0b5a57a64b601775b296abf77a9fe97
-# Backported in version 5.15.99 2c36c390a74981d03f04f01fe7ee9c3ac3ea11f7
-# Backported in version 6.1.16 6b4fcc4e8a3016e85766c161daf0732fca16c3a3
-CVE_CHECK_IGNORE +=3D "CVE-2023-1077"
+# Backported in version v5.15.99 2c36c390a74981d03f04f01fe7ee9c3ac3ea11f7
+# Backported in version v6.1.16 6b4fcc4e8a3016e85766c161daf0732fca16c3a3
+CVE_STATUS[CVE-2023-1077] =3D "cpe-stable-backport: Backported in versions=
 v5.15.99 and v6.1.16"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2023-1078
 # Patched in kernel 6.2 f753a68980cf4b59a80fe677619da2b1804f526d
-# Backported in version 5.15.94 528e3f3a4b53df36dafd10cdf6b8c0fe2aa1c4ba
-# Backported in version 6.1.12 1d52bbfd469af69fbcae88c67f160ce1b968e7f3
-CVE_CHECK_IGNORE +=3D "CVE-2023-1078"
+# Backported in version v5.15.94 528e3f3a4b53df36dafd10cdf6b8c0fe2aa1c4ba
+# Backported in version v6.1.12 1d52bbfd469af69fbcae88c67f160ce1b968e7f3
+CVE_STATUS[CVE-2023-1078] =3D "cpe-stable-backport: Backported in versions=
 v5.15.94 and v6.1.12"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2023-1079
 # Patched in kernel since v6.3-rc1 4ab3a086d10eeec1424f2e8a968827a6336203d=
f
@@ -480,7 +488,7 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-1078"
 # Backported in version v5.15.99 3959316f8ceb17866646abc6be4a332655407138
 # Backported in version v6.1.16 ee907829b36949c452c6f89485cb2a58e97c048e
 # Backported in version v6.2.3 b08bcfb4c97d7bd41b362cff44b2c537ce9e8540
-CVE_CHECK_IGNORE +=3D "CVE-2023-1079"
+CVE_STATUS[CVE-2023-1079] =3D "cpe-stable-backport: Backported in versions=
 v5.4.235, v5.10.173, v5.15.99, v6.1.16 and v6.2.3"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2023-1118
 # Introduced in version v2.6.36 9ea53b74df9c4681f5bb2da6b2e10e37d87ea6d6
@@ -490,7 +498,7 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-1079"
 # Backported in version v5.15.99 29962c478e8b2e6a6154d8d84b8806dbe36f9c28
 # Backported in version v6.1.16 029c1410e345ce579db5c007276340d072aac54a
 # Backported in version v6.2.3 182ea492aae5b64067277e60a4ea5995c4628555
-CVE_CHECK_IGNORE +=3D "CVE-2023-1118"
+CVE_STATUS[CVE-2023-1118] =3D "cpe-stable-backport: Backported in versions=
 v5.4.235, v5.10.173, v5.15.99, v6.1.16 and v6.2.3"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2023-1281
 # Introduced in version v4.14 9b0d4446b56904b59ae3809913b0ac760fa941a6
@@ -498,7 +506,7 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-1118"
 # Backported in version v5.10.169 eb8e9d8572d1d9df17272783ad8a84843ce559d4
 # Backported in version v5.15.95 becf55394f6acb60dd60634a1c797e73c747f9da
 # Backported in version v6.1.13 bd662ba56187b5ef8a62a3511371cd38299a507f
-CVE_CHECK_IGNORE +=3D "CVE-2023-1281"
+CVE_STATUS[CVE-2023-1281] =3D "cpe-stable-backport: Backported in versions=
 v5.10.169, v5.15.95 and v6.1.13"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2023-1513
 # Patched in kernel since v6.2 2c10b61421a28e95a46ab489fd56c0f442ff6952
@@ -506,7 +514,7 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-1281"
 # Backported in version v5.10.169 6416c2108ba54d569e4c98d3b62ac78cb12e7107
 # Backported in version v5.15.95 35351e3060d67eed8af1575d74b71347a87425d8
 # Backported in version v6.1.13 747ca7c8a0c7bce004709143d1cd6596b79b1deb
-CVE_CHECK_IGNORE +=3D "CVE-2023-1513"
+CVE_STATUS[CVE-2023-1513] =3D "cpe-stable-backport: Backported in versions=
 v5.4.232, v5.10.169, v5.15.95 and v6.1.13"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2023-1652
 # Patched in kernel since v6.2 e6cf91b7b47ff82b624bdfe2fdcde32bb52e71dd
@@ -514,7 +522,7 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-1513"
 # Backported in version v6.1.9 32d5eb95f8f0e362e37c393310b13b9e95404560
 # Ref: https://www.linuxkernelcves.com/cves/CVE-2023-1652
 # Ref: Debian kernel-sec team: https://salsa.debian.org/kernel-team/kernel=
-sec/-/blob/1fa77554d4721da54e2df06fa1908a83ba6b1045/retired/CVE-2023-1652
-CVE_CHECK_IGNORE +=3D "CVE-2023-1652"
+CVE_STATUS[CVE-2023-1652] =3D "cpe-stable-backport: Backported in versions=
 v5.15.91 and v6.1.9"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2023-1829
 # Patched in kernel since v6.3-rc1 8c710f75256bb3cf05ac7b1672c82b92c43f3d2=
8
@@ -525,7 +533,7 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-1652"
 # Backported in version v6.2.5 372ae77cf11d11fb118cbe2d37def9dd5f826abd
 # Ref: https://www.linuxkernelcves.com/cves/CVE-2023-1829
 # Ref: Debian kernel-sec team : https://salsa.debian.org/kernel-team/kerne=
l-sec/-/blob/1fa77554d4721da54e2df06fa1908a83ba6b1045/active/CVE-2023-1829
-CVE_CHECK_IGNORE +=3D "CVE-2023-1829"
+CVE_STATUS[CVE-2023-1829] =3D "cpe-stable-backport: Backported in versions=
 v5.4.235, v5.10.173, v5.15.100, v6.1.18 and v6.2.5"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2023-23005
 # Introduced in version v6.1 7b88bda3761b95856cf97822efe8281c8100067b
@@ -535,7 +543,7 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-1829"
 # > in which a user can cause the alloc_memory_type error case to be reach=
ed.
 # See: https://bugzilla.suse.com/show_bug.cgi?id=3D1208844#c2
 # We can safely ignore it.
-CVE_CHECK_IGNORE +=3D "CVE-2023-23005"
+CVE_STATUS[CVE-2023-23005] =3D "disputed: Disputed by third parties becaus=
e there are no realistic cases in which a user can cause the alloc_memory_t=
ype error case to be reached."
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2023-28466
 # Introduced in version v4.13 3c4d7559159bfe1e3b94df3a657b2cda3a34e218
@@ -543,127 +551,102 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-23005"
 # Backported in version v5.15.105 0b54d75aa43a1edebc8a3770901f5c3557ee0daa
 # Backported in version v6.1.20 14c17c673e1bba08032d245d5fb025d1cbfee123
 # Backported in version v6.2.7 5231fa057bb0e52095591b303cf95ebd17bc62ce
-CVE_CHECK_IGNORE +=3D "CVE-2023-28466"
+CVE_STATUS[CVE-2023-28466] =3D "cpe-stable-backport: Backported in version=
s v5.15.105, v6.1.20 and v6.2.7"
=20
-# Wrong CPE in NVD database
 # https://nvd.nist.gov/vuln/detail/CVE-2022-3563
 # https://nvd.nist.gov/vuln/detail/CVE-2022-3637
-#=C2=A0Those issue do not affect the kernel, patchs listed on CVE pages li=
nks to https://git.kernel.org/pub/scm/bluetooth/bluez.git
-CVE_CHECK_IGNORE +=3D "CVE-2022-3563 CVE-2022-3637"
-
-# qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/d=
etail?vulnId=3DCVE-2021-20255
-# There was a proposed patch https://lists.gnu.org/archive/html/qemu-devel=
/2021-02/msg06098.html
-# qemu maintainers say the patch is incorrect and should not be applied
-# Ignore from OE's perspectivee as the issue is of low impact, at worst si=
tting in an infinite loop rather than exploitable
-CVE_CHECK_IGNORE +=3D "CVE-2021-20255"
-
-# qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/d=
etail?vulnId=3DCVE-2019-12067
-# There was a proposed patch but rejected by upstream qemu. It is unclear =
if the issue can
-# still be reproduced or where exactly any bug is.
-# Ignore from OE's perspective as we'll pick up any fix when upstream acce=
pts one.
-CVE_CHECK_IGNORE +=3D "CVE-2019-12067"
-
-# nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-=
2020-18974
-# It is a fuzzing related buffer overflow. It is of low impact since most =
devices
-# wouldn't expose an assembler. The upstream is inactive and there is litt=
le to be
-# done about the bug, ignore from an OE perspective.
-CVE_CHECK_IGNORE +=3D "CVE-2020-18974"
+CVE_STATUS[CVE-2022-3563] =3D "cpe-incorrect: This issue do not affect the=
 kernel, patchs listed on CVE pages links to https://git.kernel.org/pub/scm=
/bluetooth/bluez.git"
+CVE_STATUS[CVE-2022-3637] =3D "cpe-incorrect: This issue do not affect the=
 kernel, patchs listed on CVE pages links to https://git.kernel.org/pub/scm=
/bluetooth/bluez.git"
+
+# qemu:qemu-native:qemu-system-native https://nvd.nist.gov/vuln/detail/CVE=
-2021-20255
+CVE_STATUS[CVE-2021-20255] =3D "upstream-wontfix: \
+There was a proposed patch https://lists.gnu.org/archive/html/qemu-devel/2=
021-02/msg06098.html \
+qemu maintainers say the patch is incorrect and should not be applied \
+The issue is of low impact, at worst sitting in an infinite loop rather th=
an exploitable."
+
+# qemu:qemu-native:qemu-system-native https://nvd.nist.gov/vuln/detail/CVE=
-2019-12067
+CVE_STATUS[CVE-2019-12067] =3D "upstream-wontfix: \
+There was a proposed patch but rejected by upstream qemu. It is unclear if=
 the issue can \
+still be reproduced or where exactly any bug is. \
+We'll pick up any fix when upstream accepts one."
+
+# nasm:nasm-native https://nvd.nist.gov/vuln/detail/CVE-2020-18974
+CVE_STATUS[CVE-2020-18974] =3D "upstream-wontfix: \
+It is a fuzzing related buffer overflow. It is of low impact since most de=
vices
+wouldn't expose an assembler. The upstream is inactive and there is little=
 to be
+done about the bug, ignore from an OE perspective."
=20
 # https://www.linuxkernelcves.com/cves/CVE-2023-0459
-# Fixed in 6.1.14 onwards
-CVE_CHECK_IGNORE +=3D "CVE-2023-0459"
+CVE_STATUS[CVE-2023-0459] =3D "cpe-stable-backport: Backported in 6.1.14"
=20
 # https://www.linuxkernelcves.com/cves/CVE-2023-0615
-# Fixed in 6.1 onwards
-CVE_CHECK_IGNORE +=3D "CVE-2023-0615"
+CVE_STATUS[CVE-2023-0615] =3D "cpe-stable-backport: Backported in 6.1"
=20
 # https://www.linuxkernelcves.com/cves/CVE-2023-1380
-# Fixed in 6.1.27
-CVE_CHECK_IGNORE +=3D "CVE-2023-1380"
+CVE_STATUS[CVE-2023-1380] =3D "cpe-stable-backport: Backported in 6.1.27"
=20
 # https://www.linuxkernelcves.com/cves/CVE-2023-1611
-# Fixed in 6.1.23
-CVE_CHECK_IGNORE +=3D "CVE-2023-1611"
+CVE_STATUS[CVE-2023-1611] =3D "cpe-stable-backport: Backported in 6.1.23"
=20
 # https://www.linuxkernelcves.com/cves/CVE-2023-1855
-# Fixed in 6.1.21
-CVE_CHECK_IGNORE +=3D "CVE-2023-1855"
+CVE_STATUS[CVE-2023-1855] =3D "cpe-stable-backport: Backported in 6.1.21"
=20
 # https://www.linuxkernelcves.com/cves/CVE-2023-1859
-# Fixed in 6.1.25
-CVE_CHECK_IGNORE +=3D "CVE-2023-1859"
+CVE_STATUS[CVE-2023-1859] =3D "cpe-stable-backport: Backported in 6.1.25"
=20
 # https://www.linuxkernelcves.com/cves/CVE-2023-1989
-# Fixed in 6.1.22
-CVE_CHECK_IGNORE +=3D "CVE-2023-1989"
+CVE_STATUS[CVE-2023-1989] =3D "cpe-stable-backport: Backported in 6.1.22"
=20
 # https://www.linuxkernelcves.com/cves/CVE-2023-1990
-# Fixed in 6.1.21
-CVE_CHECK_IGNORE +=3D "CVE-2023-1990"
+CVE_STATUS[CVE-2023-1990] =3D "cpe-stable-backport: Backported in 6.1.21"
=20
 # https://www.linuxkernelcves.com/cves/CVE-2023-1999
-# Fixed in 6.1.16
-CVE_CHECK_IGNORE +=3D "CVE-2023-1998"
+CVE_STATUS[CVE-2023-1998] =3D "cpe-stable-backport: Backported in 6.1.16"
=20
 # https://www.linuxkernelcves.com/cves/CVE-2023-2002
-# Fixed in 6.1.27
-CVE_CHECK_IGNORE +=3D "CVE-2023-2002"
+CVE_STATUS[CVE-2023-2002] =3D "cpe-stable-backport: Backported in 6.1.27"
=20
 # https://www.linuxkernelcves.com/cves/CVE-2023-2156
-# Fixed in 6.1.26
-CVE_CHECK_IGNORE +=3D "CVE-2023-2156"
+CVE_STATUS[CVE-2023-2156] =3D "cpe-stable-backport: Backported in 6.1.26"
=20
 # https://www.linuxkernelcves.com/cves/CVE-2023-2162
-# Fixed in 6.1.11
-CVE_CHECK_IGNORE +=3D "CVE-2023-2162"
+CVE_STATUS[CVE-2023-2162] =3D "cpe-stable-backport: Backported in 6.1.11"
=20
 # https://www.linuxkernelcves.com/cves/CVE-2023-2194
-# Fixed with 6.1.22
-CVE_CHECK_IGNORE +=3D "CVE-2023-2194"
+CVE_STATUS[CVE-2023-2194] =3D "cpe-stable-backport: Backported in 6.1.22"
=20
 # https://www.linuxkernelcves.com/cves/CVE-2023-2235
-# Fixed with 6.1.21
-CVE_CHECK_IGNORE +=3D "CVE-2023-2235"
+CVE_STATUS[CVE-2023-2235] =3D "cpe-stable-backport: Backported in 6.1.21"
=20
 # https://www.linuxkernelcves.com/cves/CVE-2023-28328
-# Fixed with 6.1.2
-CVE_CHECK_IGNORE +=3D "CVE-2023-28328"
+CVE_STATUS[CVE-2023-28328] =3D "cpe-stable-backport: Backported in 6.1.2"
=20
 # https://www.linuxkernelcves.com/cves/CVE-2023-2985
-# Fixed in 6.1.16
-CVE_CHECK_IGNORE +=3D "CVE-2023-2985"
+CVE_STATUS[CVE-2023-2985] =3D "cpe-stable-backport: Backported in 6.1.16"
=20
 # https://www.linuxkernelcves.com/cves/CVE-2023-28866
-# Fixed with 6.1.22
-CVE_CHECK_IGNORE +=3D "CVE-2023-28866"
+CVE_STATUS[CVE-2023-28866] =3D "cpe-stable-backport: Backported in 6.1.22"
=20
 # https://www.linuxkernelcves.com/cves/CVE-2023-30456
-# Fixed with 6.1.21
-CVE_CHECK_IGNORE +=3D "CVE-2023-30456"
+CVE_STATUS[CVE-2023-30456] =3D "cpe-stable-backport: Backported in 6.1.21"
=20
 # https://www.linuxkernelcves.com/cves/CVE-2023-30772
-# Fixed with 6.1.22
-CVE_CHECK_IGNORE +=3D "CVE-2023-30772"
+CVE_STATUS[CVE-2023-30772] =3D "cpe-stable-backport: Backported in 6.1.22"
=20
 # https://www.linuxkernelcves.com/cves/CVE-2023-31436
-# Fixed with 6.1.26
-CVE_CHECK_IGNORE +=3D "CVE-2023-31436"
+CVE_STATUS[CVE-2023-31436] =3D "cpe-stable-backport: Backported in 6.1.26"
=20
 # https://www.linuxkernelcves.com/cves/CVE-2023-32233
-# Fixed with 6.1.28
-CVE_CHECK_IGNORE +=3D "CVE-2023-32233"
+CVE_STATUS[CVE-2023-32233] =3D "cpe-stable-backport: Backported in 6.1.28"
=20
 # https://www.linuxkernelcves.com/cves/CVE-2023-33203
-# Fixed with 6.1.22
-CVE_CHECK_IGNORE +=3D "CVE-2023-33203"
+CVE_STATUS[CVE-2023-33203] =3D "cpe-stable-backport: Backported in 6.1.22"
=20
 # https://www.linuxkernelcves.com/cves/CVE-2023-33288
-# Fixed with 6.1.22
-CVE_CHECK_IGNORE +=3D "CVE-2023-33288"
+CVE_STATUS[CVE-2023-33288] =3D "cpe-stable-backport: Backported in 6.1.22"
=20
 # https://www.linuxkernelcves.com/cves/CVE-2023-34256
-# Fixed in 6.1.29
-CVE_CHECK_IGNORE +=3D "CVE-2023-34256"
+CVE_STATUS[CVE-2023-34256] =3D "cpe-stable-backport: Backported in 6.1.29"
=20
 # Backported to 6.1.30 as 9a342d4
-CVE_CHECK_IGNORE +=3D "CVE-2023-3141"
+CVE_STATUS[CVE-2023-3141] =3D "cpe-stable-backport: Backported in 6.1.30"
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.=
inc
index 58b215d79c..41839698dc 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -46,10 +46,8 @@ SRC_URI =3D "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
=20
 SRC_URI[sha256sum] =3D "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62=
aa3f53ae803f5f"
=20
-# Applies only to RHEL
-CVE_CHECK_IGNORE +=3D "CVE-2019-14865"
-# Applies only to SUSE
-CVE_CHECK_IGNORE +=3D "CVE-2021-46705"
+CVE_STATUS[CVE-2019-14865] =3D "not-applicable-platform: applies only to R=
HEL"
+CVE_STATUS[CVE-2021-46705] =3D "not-applicable-platform: Applies only to S=
USE"
=20
 DEPENDS =3D "flex-native bison-native gettext-native"
=20
diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-co=
nnectivity/avahi/avahi_0.8.bb
index 1764997c41..d1c6f7f54a 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -32,8 +32,7 @@ GITHUB_BASE_URI =3D "https://github.com/lathiat/avahi/rel=
eases/"
 SRC_URI[md5sum] =3D "229c6aa30674fc43c202b22c5f8c2be7"
 SRC_URI[sha256sum] =3D "060309d7a333d38d951bc27598c677af1796934dbd98e1024e=
7ad8de798fedda"
=20
-# Issue only affects Debian/SUSE, not us
-CVE_CHECK_IGNORE +=3D "CVE-2021-26720"
+CVE_STATUS[CVE-2021-26720] =3D "not-applicable-platform: Issue only affect=
s Debian/SUSE"
=20
 DEPENDS =3D "expat libcap libdaemon glib-2.0 glib-2.0-native"
=20
diff --git a/meta/recipes-connectivity/bind/bind_9.18.15.bb b/meta/recipes-=
connectivity/bind/bind_9.18.15.bb
index 80164aad87..26a280c844 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.15.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.15.bb
@@ -28,7 +28,7 @@ UPSTREAM_CHECK_REGEX =3D "(?P<pver>9.(\d*[02468])+(\.\d+)=
+(-P\d+)*)/"
=20
 # Issue only affects dhcpd with recent bind versions. We don't ship dhcpd =
anymore
 # so the issue doesn't affect us.
-CVE_CHECK_IGNORE +=3D "CVE-2019-6470"
+CVE_STATUS[CVE-2019-6470] =3D "not-applicable-config: Issue only affects d=
hcpd with recent bind versions and we don't ship dhcpd anymore."
=20
 inherit autotools update-rc.d systemd useradd pkgconfig multilib_header up=
date-alternatives
=20
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.66.bb b/meta/recipes=
-connectivity/bluez5/bluez5_5.66.bb
index 2208b730b0..31f325e590 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.66.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.66.bb
@@ -2,8 +2,8 @@ require bluez5.inc
=20
 SRC_URI[sha256sum] =3D "39fea64b590c9492984a0c27a89fc203e1cdc74866086efb8f=
4698677ab2b574"
=20
-# These issues have kernel fixes rather than bluez fixes so exclude here
-CVE_CHECK_IGNORE +=3D "CVE-2020-12352 CVE-2020-24490"
+CVE_STATUS[CVE-2022-3563] =3D "cpe-incorrect: This issues have kernel fixe=
s rather than bluez fixes"
+CVE_STATUS[CVE-2022-3637] =3D "cpe-incorrect: This issues have kernel fixe=
s rather than bluez fixes"
=20
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
diff --git a/meta/recipes-connectivity/openssh/openssh_9.3p1.bb b/meta/reci=
pes-connectivity/openssh/openssh_9.3p1.bb
index 42ce814523..3edc123b9a 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.3p1.bb
@@ -28,15 +28,14 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH=
/portable/openssh-${PV}.tar
            "
 SRC_URI[sha256sum] =3D "e9baba7701a76a51f3d85a62c383a3c9dcd97fa900b859bc7d=
b114c1868af8a8"
=20
-# This CVE is specific to OpenSSH with the pam opie which we don't build/u=
se here
-CVE_CHECK_IGNORE +=3D "CVE-2007-2768"
+CVE_STATUS[CVE-2007-2768] =3D "not-applicable-config: This CVE is specific=
 to OpenSSH with the pam opie which we don't build/use here."
=20
 # This CVE is specific to OpenSSH server, as used in Fedora and Red Hat En=
terprise Linux 7
 # and when running in a Kerberos environment. As such it is not relevant t=
o OpenEmbedded
-CVE_CHECK_IGNORE +=3D "CVE-2014-9278"
+CVE_STATUS[CVE-2014-9278] =3D "not-applicable-platform: This CVE is specif=
ic to OpenSSH server, as used in Fedora and \
+Red Hat Enterprise Linux 7 and when running in a Kerberos environment"
=20
-# CVE only applies to some distributed RHEL binaries
-CVE_CHECK_IGNORE +=3D "CVE-2008-3844"
+CVE_STATUS[CVE-2008-3844] =3D "not-applicable-platform: Only applies to so=
me distributed RHEL binaries."
=20
 PAM_SRC_URI =3D "file://sshd"
=20
diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.1.bb b/meta/reci=
pes-connectivity/openssl/openssl_3.1.1.bb
index f5f3f32a97..e3557348e8 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
@@ -253,6 +253,5 @@ CVE_PRODUCT =3D "openssl:openssl"
=20
 CVE_VERSION_SUFFIX =3D "alphabetical"
=20
-# Only affects OpenSSL >=3D 1.1.1 in combination with Apache < 2.4.37
 # Apache in meta-webserver is already recent enough
-CVE_CHECK_IGNORE +=3D "CVE-2019-0190"
+CVE_STATUS[CVE-2019-0190] =3D "not-applicable-config: Only affects OpenSSL=
 >=3D 1.1.1 in combination with Apache < 2.4.37"
diff --git a/meta/recipes-core/coreutils/coreutils_9.3.bb b/meta/recipes-co=
re/coreutils/coreutils_9.3.bb
index 25da988f50..ba38169f05 100644
--- a/meta/recipes-core/coreutils/coreutils_9.3.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.3.bb
@@ -23,8 +23,8 @@ SRC_URI =3D "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
 SRC_URI[sha256sum] =3D "adbcfcfe899235b71e8768dcf07cd532520b7f54f9a8064843=
f8d199a904bbaa"
=20
 # http://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=3Dv8.27-101-gf=
5d7c0842
-# runcon is not really a sandbox command, use `runcon ... setsid ...` to a=
void this particular issue.
-CVE_CHECK_IGNORE +=3D "CVE-2016-2781"
+#=20
+CVE_STATUS[CVE-2016-2781] =3D "disputed: runcon is not really a sandbox co=
mmand, use `runcon ... setsid ...` to avoid this particular issue."
=20
 EXTRA_OECONF:class-target =3D "--enable-install-program=3Darch,hostname --=
libexecdir=3D${libdir}"
 EXTRA_OECONF:class-nativesdk =3D "--enable-install-program=3Darch,hostname=
"
diff --git a/meta/recipes-core/glibc/glibc_2.37.bb b/meta/recipes-core/glib=
c/glibc_2.37.bb
index 3387441cad..851aa612b1 100644
--- a/meta/recipes-core/glibc/glibc_2.37.bb
+++ b/meta/recipes-core/glibc/glibc_2.37.bb
@@ -4,18 +4,19 @@ require glibc-version.inc
 # glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-101002=
2
 # glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-101002=
3
 # glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-101002=
4
-# Upstream glibc maintainers dispute there is any issue and have no plans =
to address it further.
-# "this is being treated as a non-security bug and no real threat."
-CVE_CHECK_IGNORE +=3D "CVE-2019-1010022 CVE-2019-1010023 CVE-2019-1010024"
+CVE_STATUS_GROUPS =3D "CVE_STATUS_RECIPE"
+CVE_STATUS_RECIPE =3D "CVE-2019-1010022 CVE-2019-1010023 CVE-2019-1010024"
+CVE_STATUS_RECIPE[status] =3D "disputed: \
+Upstream glibc maintainers dispute there is any issue and have no plans to=
 address it further. \
+this is being treated as a non-security bug and no real threat."
=20
 # glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-101002=
5
-# Allows for ASLR bypass so can bypass some hardening, not an exploit in i=
tself, may allow
-# easier access for another. "ASLR bypass itself is not a vulnerability."
 # Potential patch at https://sourceware.org/bugzilla/show_bug.cgi?id=3D228=
53
-CVE_CHECK_IGNORE +=3D "CVE-2019-1010025"
+CVE_STATUS[CVE-2019-1010025] =3D "disputed: \
+Allows for ASLR bypass so can bypass some hardening, not an exploit in its=
elf, may allow \
+easier access for another. 'ASLR bypass itself is not a vulnerability.'"
=20
-# This is integrated into the 2.37 branch as of 07b9521fc6
-CVE_CHECK_IGNORE +=3D "CVE-2023-25139"
+CVE_STATUS[CVE-2023-25139] =3D "cpe-stable-backport: This is integrated in=
to the 2.37 branch as of 07b9521fc6"
=20
 DEPENDS +=3D "gperf-native bison-native"
=20
diff --git a/meta/recipes-core/libxml/libxml2_2.10.4.bb b/meta/recipes-core=
/libxml/libxml2_2.10.4.bb
index 4f3b17093e..095ecf8602 100644
--- a/meta/recipes-core/libxml/libxml2_2.10.4.bb
+++ b/meta/recipes-core/libxml/libxml2_2.10.4.bb
@@ -26,10 +26,6 @@ SRC_URI[testtar.sha256sum] =3D "c6b2d42ee50b8b236e711a97=
d68e6c4b5c8d83e69a2be47223
=20
 BINCONFIG =3D "${bindir}/xml2-config"
=20
-# Fixed since 2.9.11 via
-# https://gitlab.gnome.org/GNOME/libxml2/-/commit/c1ba6f54d32b707ca6d91cb3=
257ce9de82876b6f
-CVE_CHECK_IGNORE +=3D "CVE-2016-3709"
-
 PACKAGECONFIG ??=3D "python \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
 "
diff --git a/meta/recipes-core/systemd/systemd_253.3.bb b/meta/recipes-core=
/systemd/systemd_253.3.bb
index 87fbf6f785..cf0e17ff00 100644
--- a/meta/recipes-core/systemd/systemd_253.3.bb
+++ b/meta/recipes-core/systemd/systemd_253.3.bb
@@ -834,6 +834,3 @@ pkg_postinst:udev-hwdb () {
 pkg_prerm:udev-hwdb () {
 	rm -f $D${sysconfdir}/udev/hwdb.bin
 }
-
-# This was also fixed in 252.4 with 9b75a3d0
-CVE_CHECK_IGNORE +=3D "CVE-2022-4415"
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/=
cmake/cmake.inc
index 7788a5c45a..f57a77c7bb 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -23,6 +23,4 @@ SRC_URI[sha256sum] =3D "313b6880c291bd4fe31c0aa51d6e62659=
282a521e695f30d5cc0d25abb
=20
 UPSTREAM_CHECK_REGEX =3D "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
=20
-# This is specific to the npm package that installs cmake, so isn't
-# relevant to OpenEmbedded
-CVE_CHECK_IGNORE +=3D "CVE-2016-10642"
+CVE_STATUS[CVE-2016-10642] =3D "cpe-incorrect: This is specific to the npm=
 package that installs cmake, so isn't relevant to OpenEmbedded"
diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devtoo=
ls/flex/flex_2.6.4.bb
index 15cf6f5cca..1ac88d65ef 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -26,10 +26,10 @@ SRC_URI[sha256sum] =3D "e87aae032bf07c26f85ac0ed3250998=
c37621d95f8bd748b31f15b33c4
=20
 GITHUB_BASE_URI =3D "https://github.com/westes/flex/releases"
=20
-# Disputed - yes there is stack exhaustion but no bug and it is building t=
he
-# parser, not running it, effectively similar to a compiler ICE. Upstream =
no plans to address
 # https://github.com/westes/flex/issues/414
-CVE_CHECK_IGNORE +=3D "CVE-2019-6293"
+CVE_STATUS[CVE-2019-6293] =3D "upstream-wontfix: \
+there is stack exhaustion but no bug and it is building the \
+parser, not running it, effectively similar to a compiler ICE. Upstream no=
 plans to address this."
=20
 inherit autotools gettext texinfo ptest github-releases
=20
diff --git a/meta/recipes-devtools/gcc/gcc-13.1.inc b/meta/recipes-devtools=
/gcc/gcc-13.1.inc
index 4da703db52..e94753eed0 100644
--- a/meta/recipes-devtools/gcc/gcc-13.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-13.1.inc
@@ -111,5 +111,4 @@ EXTRA_OECONF_PATHS =3D "\
     --with-build-sysroot=3D${STAGING_DIR_TARGET} \
 "
=20
-# Is a binutils 2.26 issue, not gcc
-CVE_CHECK_IGNORE +=3D "CVE-2021-37322"
+CVE_STATUS[CVE-2021-37322] =3D "cpe-incorrect: Is a binutils 2.26 issue, n=
ot gcc"
diff --git a/meta/recipes-devtools/git/git_2.39.3.bb b/meta/recipes-devtool=
s/git/git_2.39.3.bb
index 54a863acd2..3393550c85 100644
--- a/meta/recipes-devtools/git/git_2.39.3.bb
+++ b/meta/recipes-devtools/git/git_2.39.3.bb
@@ -27,13 +27,6 @@ LIC_FILES_CHKSUM =3D "\
=20
 CVE_PRODUCT =3D "git-scm:git"
=20
-# This is about a manpage not mentioning --mirror may "leak" information
-# in mirrored git repos. Most OE users wouldn't build the docs and
-# we don't see this as a major issue for our general users/usecases.
-CVE_CHECK_IGNORE +=3D "CVE-2022-24975"
-# This is specific to Git-for-Windows
-CVE_CHECK_IGNORE +=3D "CVE-2022-41953"
-
 PACKAGECONFIG ??=3D "expat curl"
 PACKAGECONFIG[cvsserver] =3D ""
 PACKAGECONFIG[svn] =3D ""
diff --git a/meta/recipes-devtools/jquery/jquery_3.6.3.bb b/meta/recipes-de=
vtools/jquery/jquery_3.6.3.bb
index 93f87f730d..db4745ad7a 100644
--- a/meta/recipes-devtools/jquery/jquery_3.6.3.bb
+++ b/meta/recipes-devtools/jquery/jquery_3.6.3.bb
@@ -20,9 +20,8 @@ SRC_URI[map.sha256sum] =3D "156b740931ade6c1a98d99713eeb1=
86f93847ffc56057e973becab
 UPSTREAM_CHECK_REGEX =3D "jquery-(?P<pver>\d+(\.\d+)+)\.js"
=20
 # https://github.com/jquery/jquery/issues/3927
-# There are ways jquery can expose security issues but any issues are in t=
he apps exposing them
-# and there is little we can directly do
-CVE_CHECK_IGNORE +=3D "CVE-2007-2379"
+CVE_STATUS[CVE-2007-2379] =3D "upstream-wontfix: There are ways jquery can=
 expose security issues but any issues \
+are in the apps exposing them and there is little we can directly do."
=20
 inherit allarch
=20
diff --git a/meta/recipes-devtools/ninja/ninja_1.11.1.bb b/meta/recipes-dev=
tools/ninja/ninja_1.11.1.bb
index 83d2f01263..8e297ec4d4 100644
--- a/meta/recipes-devtools/ninja/ninja_1.11.1.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.11.1.bb
@@ -30,5 +30,4 @@ do_install() {
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
-# This is a different Ninja
-CVE_CHECK_IGNORE +=3D "CVE-2021-4336"
+CVE_STATUS[CVE-2021-4336] =3D "cpe-incorrect: This is a different Ninja"
diff --git a/meta/recipes-devtools/python/python3_3.11.3.bb b/meta/recipes-=
devtools/python/python3_3.11.3.bb
index c7974849b6..59f93861dd 100644
--- a/meta/recipes-devtools/python/python3_3.11.3.bb
+++ b/meta/recipes-devtools/python/python3_3.11.3.bb
@@ -47,15 +47,12 @@ UPSTREAM_CHECK_URI =3D "https://www.python.org/download=
s/source/"
=20
 CVE_PRODUCT =3D "python"
=20
-# Upstream consider this expected behaviour
-CVE_CHECK_IGNORE +=3D "CVE-2007-4559"
-# This is not exploitable when glibc has CVE-2016-10739 fixed.
-CVE_CHECK_IGNORE +=3D "CVE-2019-18348"
-# These are specific to Microsoft Windows
-CVE_CHECK_IGNORE +=3D "CVE-2020-15523 CVE-2022-26488"
-# The mailcap module is insecure by design, so this can't be fixed in a me=
aningful way.
+CVE_STATUS[CVE-2007-4559] =3D "disputed: Upstream consider this expected b=
ehaviour"
+CVE_STATUS[CVE-2019-18348] =3D "not-applicable-config: This is not exploit=
able when glibc has CVE-2016-10739 fixed"
+CVE_STATUS[CVE-2020-15523] =3D "not-applicable-platform: Issue only applie=
s on Windows"
+CVE_STATUS[CVE-2022-26488] =3D "not-applicable-platform: Issue only applie=
s on Windows"
 # The module will be removed in the future and flaws documented.
-CVE_CHECK_IGNORE +=3D "CVE-2015-20107"
+CVE_STATUS[CVE-2015-20107] =3D "upstream-wontfix: The mailcap module is in=
secure by design, so this can't be fixed in a meaningful way"
=20
 PYTHON_MAJMIN =3D "3.11"
=20
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc
index 6acda61425..480aa97c30 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -39,21 +39,16 @@ SRC_URI[sha256sum] =3D "bb60f0341531181d6cc3969dd19a013=
d0427a87f918193970d9adb9113
 SRC_URI:append:class-target =3D " file://cross.patch"
 SRC_URI:append:class-nativesdk =3D " file://cross.patch"
=20
-# Applies against virglrender < 0.6.0 and not qemu itself
-CVE_CHECK_IGNORE +=3D "CVE-2017-5957"
+CVE_STATUS[CVE-2017-5957] =3D "cpe-incorrect: Applies against virglrender =
< 0.6.0 and not qemu itself"
=20
-# The VNC server can expose host files uder some circumstances. We don't
-# enable it by default.
-CVE_CHECK_IGNORE +=3D "CVE-2007-0998"
+CVE_STATUS[CVE-2007-0998] =3D "not-applicable-config: The VNC server can e=
xpose host files uder some circumstances. We don't enable it by default."
=20
-# 'The issues identified by this CVE were determined to not constitute a v=
ulnerability.'
 # https://bugzilla.redhat.com/show_bug.cgi?id=3D1609015#c11
-CVE_CHECK_IGNORE +=3D "CVE-2018-18438"
+CVE_STATUS[CVE-2018-18438] =3D "disputed: The issues identified by this CV=
E were determined to not constitute a vulnerability."
=20
 # As per https://nvd.nist.gov/vuln/detail/CVE-2023-0664
 # https://bugzilla.redhat.com/show_bug.cgi?id=3D2167423
-# this bug related to windows specific.
-CVE_CHECK_IGNORE +=3D "CVE-2023-0664"
+CVE_STATUS[CVE-2023-0664] =3D "not-applicable-platform: Issue only applies=
 on Windows"
=20
 COMPATIBLE_HOST:mipsarchn32 =3D "null"
 COMPATIBLE_HOST:mipsarchn64 =3D "null"
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-devt=
ools/rsync/rsync_3.2.7.bb
index 19574bcb1c..130581a785 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
@@ -18,9 +18,6 @@ SRC_URI =3D "https://download.samba.org/pub/${BPN}/src/${=
BP}.tar.gz \
            "
 SRC_URI[sha256sum] =3D "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488=
fb2dc41346f2bb"
=20
-# -16548 required for v3.1.3pre1. Already in v3.1.3.
-CVE_CHECK_IGNORE +=3D " CVE-2017-16548 "
-
 inherit autotools-brokensep
=20
 PACKAGECONFIG ??=3D "acl attr \
diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.13.bb b/meta/recipes-devto=
ols/tcltk/tcl_8.6.13.bb
index 982f370edb..91fc81352e 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.13.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.13.bb
@@ -29,10 +29,6 @@ SRC_URI[sha256sum] =3D "c61f0d6699e2bc7691f119b41963aaa8=
dc980f23532c4e937739832a5f
=20
 SRC_URI:class-native =3D "${BASE_SRC_URI}"
=20
-# Upstream don't believe this is an exploitable issue
-# https://core.tcl-lang.org/tcl/info/7079e4f91601e9c7
-CVE_CHECK_IGNORE +=3D "CVE-2021-35331"
-
 UPSTREAM_CHECK_URI =3D "https://www.tcl.tk/software/tcltk/download.html"
 UPSTREAM_CHECK_REGEX =3D "tcl(?P<pver>\d+(\.\d+)+)-src"
=20
diff --git a/meta/recipes-extended/cpio/cpio_2.14.bb b/meta/recipes-extende=
d/cpio/cpio_2.14.bb
index e55fb70cb1..397bb5d87c 100644
--- a/meta/recipes-extended/cpio/cpio_2.14.bb
+++ b/meta/recipes-extended/cpio/cpio_2.14.bb
@@ -16,8 +16,7 @@ SRC_URI[sha256sum] =3D "145a340fd9d55f0b84779a44a12d5f79d=
77c99663967f8cfa168d7905c
=20
 inherit autotools gettext texinfo ptest
=20
-# Issue applies to use of cpio in SUSE/OBS, doesn't apply to us
-CVE_CHECK_IGNORE +=3D "CVE-2010-4226"
+CVE_STATUS[CVE-2010-4226] =3D "not-applicable-platform: Issue applies to u=
se of cpio in SUSE/OBS"
=20
 EXTRA_OECONF +=3D "DEFAULT_RMT_DIR=3D${sbindir}"
=20
diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cu=
ps/cups.inc
index d77758fd3f..ec4abeb936 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -20,14 +20,11 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/cups-${=
PV}-source.tar.gz \
=20
 GITHUB_BASE_URI =3D "https://github.com/OpenPrinting/cups/releases"
=20
-# Issue only applies to MacOS
-CVE_CHECK_IGNORE +=3D "CVE-2008-1033"
-# Issue affects pdfdistiller plugin used with but not part of cups
-CVE_CHECK_IGNORE +=3D "CVE-2009-0032"
-# This is an Ubuntu only issue.
-CVE_CHECK_IGNORE +=3D "CVE-2018-6553"
-# This is fixed in 2.4.2 but the cve-check class still reports it
-CVE_CHECK_IGNORE +=3D "CVE-2022-26691"
+CVE_STATUS[CVE-2008-1033] =3D "not-applicable-platform: Issue only applies=
 to MacOS"
+CVE_STATUS[CVE-2009-0032] =3D "cpe-incorrect: Issue affects pdfdistiller p=
lugin used with but not part of cups"
+CVE_STATUS[CVE-2018-6553] =3D "not-applicable-platform: This is an Ubuntu =
only issue"
+CVE_STATUS[CVE-2022-26691] =3D "fixed-version: This is fixed in 2.4.2 but =
the cve-check class still reports it"
+CVE_STATUS[CVE-2021-25317] =3D "not-applicable-config: This concerns /var/=
log/cups having lp ownership, our /var/log/cups is root:root, so this doesn=
't apply."
=20
 LEAD_SONAME =3D "libcupsdriver.so"
=20
@@ -115,7 +112,3 @@ SYSROOT_PREPROCESS_FUNCS +=3D "cups_sysroot_preprocess"
 cups_sysroot_preprocess () {
 	sed -i ${SYSROOT_DESTDIR}${bindir_crossscripts}/cups-config -e 's:cups_da=
tadir=3D.*:cups_datadir=3D${datadir}/cups:' -e 's:cups_serverbin=3D.*:cups_=
serverbin=3D${libexecdir}/cups:'
 }
-
-# -25317 concerns /var/log/cups having lp ownership.  Our /var/log/cups is
-# root:root, so this doesn't apply.
-CVE_CHECK_IGNORE +=3D "CVE-2021-25317"
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb b/met=
a/recipes-extended/ghostscript/ghostscript_10.01.1.bb
index f03ebf4478..4c0888e6a7 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb
@@ -18,8 +18,7 @@ DEPENDS =3D "tiff jpeg fontconfig cups libpng freetype zl=
ib"
 UPSTREAM_CHECK_URI =3D "https://github.com/ArtifexSoftware/ghostpdl-downlo=
ads/releases"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)\.tar"
=20
-# We use a system libjpeg-turbo which has this fix
-CVE_CHECK_IGNORE +=3D "CVE-2013-6629"
+CVE_STATUS[CVE-2013-6629] =3D "not-applicable-config: We use a system libj=
peg-turbo which has this fix"
=20
 def gs_verdir(v):
     return "".join(v.split("."))
diff --git a/meta/recipes-extended/iputils/iputils_20221126.bb b/meta/recip=
es-extended/iputils/iputils_20221126.bb
index cd5fe9bd3e..7d94271a64 100644
--- a/meta/recipes-extended/iputils/iputils_20221126.bb
+++ b/meta/recipes-extended/iputils/iputils_20221126.bb
@@ -17,9 +17,8 @@ S =3D "${WORKDIR}/git"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>20\d+)"
=20
-# Fixed in 2000-10-10, but the versioning of iputils
-# breaks the version order.
-CVE_CHECK_IGNORE +=3D "CVE-2000-1213 CVE-2000-1214"
+CVE_STATUS[CVE-2000-1213] =3D "fixed-version: Fixed in 2000-10-10, but the=
 versioning of iputils breaks the version order."
+CVE_STATUS[CVE-2000-1214] =3D "fixed-version: Fixed in 2000-10-10, but the=
 versioning of iputils breaks the version order."
=20
 PACKAGECONFIG ??=3D "libcap"
 PACKAGECONFIG[libcap] =3D "-DUSE_CAP=3Dtrue, -DUSE_CAP=3Dfalse -DNO_SETCAP=
_OR_SUID=3Dtrue, libcap libcap-native"
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb b/meta/recipe=
s-extended/libtirpc/libtirpc_1.3.3.bb
index f55e0b0ed1..d466905426 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb
@@ -14,8 +14,7 @@ UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/=
libtirpc/files/libtirpc/"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)/"
 SRC_URI[sha256sum] =3D "6474e98851d9f6f33871957ddee9714fdcd9d8a5ee9abb5a98=
d63ea2e60e12f3"
=20
-# Was fixed in 1.3.3rc1 so not present in 1.3.3
-CVE_CHECK_IGNORE +=3D "CVE-2021-46828"
+CVE_STATUS[CVE-2021-46828] =3D "fixed-version: fixed in 1.3.3rc1 so not pr=
esent in 1.3.3"
=20
 inherit autotools pkgconfig
=20
diff --git a/meta/recipes-extended/procps/procps_4.0.3.bb b/meta/recipes-ex=
tended/procps/procps_4.0.3.bb
index cc3420df4e..dc0e957bda 100644
--- a/meta/recipes-extended/procps/procps_4.0.3.bb
+++ b/meta/recipes-extended/procps/procps_4.0.3.bb
@@ -72,10 +72,6 @@ python __anonymous() {
         d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('b=
ase_sbindir'), prog))
 }
=20
-# 'ps' isn't suitable for use as a security tool so whitelist this CVE.
-# https://bugzilla.redhat.com/show_bug.cgi?id=3D1575473#c3
-CVE_CHECK_IGNORE +=3D "CVE-2018-1121"
-
 PROCPS_PACKAGES =3D "${PN}-lib \
                    ${PN}-ps \
                    ${PN}-sysctl"
diff --git a/meta/recipes-extended/shadow/shadow_4.13.bb b/meta/recipes-ext=
ended/shadow/shadow_4.13.bb
index d1a3fd5593..4e55446312 100644
--- a/meta/recipes-extended/shadow/shadow_4.13.bb
+++ b/meta/recipes-extended/shadow/shadow_4.13.bb
@@ -6,9 +6,6 @@ BUILD_LDFLAGS:append:class-target =3D " ${@bb.utils.contain=
s('DISTRO_FEATURES', 'p
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
-# Severity is low and marked as closed and won't fix.
 # https://bugzilla.redhat.com/show_bug.cgi?id=3D884658
-CVE_CHECK_IGNORE +=3D "CVE-2013-4235"
-
-# This is an issue for a different shadow
-CVE_CHECK_IGNORE +=3D "CVE-2016-15024"
+CVE_STATUS[CVE-2013-4235] =3D "upstream-wontfix: Severity is low and marke=
d as closed and won't fix."
+CVE_STATUS[CVE-2016-15024] =3D "cpe-incorrect: This is an issue for a diff=
erent shadow"
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extend=
ed/unzip/unzip_6.0.bb
index 3051e9b5bc..a53663d086 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -39,8 +39,7 @@ UPSTREAM_VERSION_UNKNOWN =3D "1"
 SRC_URI[md5sum] =3D "62b490407489521db863b523a7f86375"
 SRC_URI[sha256sum] =3D "036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49=
d30e686708bd37"
=20
-# Patch from https://bugzilla.redhat.com/attachment.cgi?id=3D293893&action=
=3Ddiff applied to 6.0 source
-CVE_CHECK_IGNORE +=3D "CVE-2008-0888"
+CVE_STATUS[CVE-2008-0888] =3D "fixed-version: Patch from https://bugzilla.=
redhat.com/attachment.cgi?id=3D293893&action=3Ddiff applied to 6.0 source"
=20
 # exclude version 5.5.2 which triggers a false positive
 UPSTREAM_CHECK_REGEX =3D "unzip(?P<pver>(?!552).+)\.tgz"
diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb b/meta/recipes=
-extended/xinetd/xinetd_2.3.15.4.bb
index c390fcf33c..72eb1ae067 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
@@ -18,7 +18,7 @@ SRCREV =3D "6a4af7786630ce48747d9687e2f18f45ea6684c4"
 S =3D "${WORKDIR}/git"
=20
 # https://github.com/xinetd-org/xinetd/pull/10 is merged into this git tre=
e revision
-CVE_CHECK_IGNORE +=3D "CVE-2013-4342"
+CVE_STATUS[CVE-2013-4342] =3D "fixed-version: Fixed directly in git tree r=
evision"
=20
 inherit autotools update-rc.d systemd pkgconfig
=20
diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/z=
ip/zip_3.0.bb
index 82153131b4..3425e8eb7b 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -26,11 +26,8 @@ UPSTREAM_VERSION_UNKNOWN =3D "1"
 SRC_URI[md5sum] =3D "7b74551e63f8ee6aab6fbc86676c0d37"
 SRC_URI[sha256sum] =3D "f0e8bb1f9b7eb0b01285495a2699df3a4b766784c1765a8f1a=
eedf63c0806369"
=20
-# Disputed and also Debian doesn't consider a vulnerability
-CVE_CHECK_IGNORE +=3D "CVE-2018-13410"
-
-# Not for zip but for smart contract implementation for it
-CVE_CHECK_IGNORE +=3D "CVE-2018-13684"
+CVE_STATUS[CVE-2018-13410] =3D "disputed: Disputed and also Debian doesn't=
 consider a vulnerability"
+CVE_STATUS[CVE-2018-13684] =3D "cpe-incorrect: Not for zip but for smart c=
ontract implementation for it"
=20
 # zip.inc sets CFLAGS, but what Makefile actually uses is
 # CFLAGS_NOOPT.  It will also force -O3 optimization, overriding
diff --git a/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb b/meta/recipes=
-gnome/libnotify/libnotify_0.8.2.bb
index 08e9899d00..6888c33d14 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb
@@ -33,4 +33,4 @@ RCONFLICTS:${PN} +=3D "libnotify3"
 RREPLACES:${PN} +=3D "libnotify3"
=20
 # -7381 is specific to the NodeJS bindings
-CVE_CHECK_IGNORE +=3D "CVE-2013-7381"
+CVE_STATUS[CVE-2013-7381] =3D "cpe-incorrect: The issue is specific to the=
 NodeJS bindings"
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb b/meta/recipes-gn=
ome/librsvg/librsvg_2.56.0.bb
index 1a5d8a6b04..1142afece1 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb
@@ -51,8 +51,7 @@ do_compile:prepend() {
     sed -ie 's,"linker": ".*","linker": "${RUST_TARGET_CC}",g' ${RUST_TARG=
ETS_DIR}/${RUST_HOST_SYS}.json
 }
=20
-# Issue only on windows
-CVE_CHECK_IGNORE +=3D "CVE-2018-1000041"
+CVE_STATUS[CVE-2018-1000041] =3D "not-applicable-platform: Issue only appl=
ies on Windows"
=20
 CACHED_CONFIGUREVARS =3D "ac_cv_path_GDK_PIXBUF_QUERYLOADERS=3D${STAGING_L=
IBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders"
=20
diff --git a/meta/recipes-graphics/builder/builder_0.1.bb b/meta/recipes-gr=
aphics/builder/builder_0.1.bb
index 39be3bd63f..1700015ded 100644
--- a/meta/recipes-graphics/builder/builder_0.1.bb
+++ b/meta/recipes-graphics/builder/builder_0.1.bb
@@ -29,5 +29,4 @@ do_install () {
 	chown  builder.builder ${D}${sysconfdir}/mini_x/session.d/builder_session=
.sh
 }
=20
-# -4178 is an unrelated 'builder'
-CVE_CHECK_IGNORE =3D "CVE-2008-4178"
+CVE_STATUS[CVE-2008-4178] =3D "cpe-incorrect: This CVE is for an unrelated=
 builder"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/rec=
ipes-graphics/xorg-xserver/xserver-xorg.inc
index ecb164ddf7..085fcaf87a 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -20,16 +20,15 @@ SRC_URI =3D "${XORG_MIRROR}/individual/xserver/${XORG_P=
N}-${PV}.tar.xz"
 UPSTREAM_CHECK_REGEX =3D "xorg-server-(?P<pver>\d+(\.(?!99)\d+)+)\.tar"
=20
 CVE_PRODUCT =3D "xorg-server x_server"
-# This is specific to Debian's xserver-wrapper.c
-CVE_CHECK_IGNORE +=3D "CVE-2011-4613"
-# As per upstream, exploiting this flaw is non-trivial and it requires exa=
ct
-# timing on the behalf of the attacker. Many graphical applications exit i=
f their
-# connection to the X server is lost, so a typical desktop session is eith=
er
-# impossible or difficult to exploit. There is currently no upstream patch
-# available for this flaw.
-CVE_CHECK_IGNORE +=3D "CVE-2020-25697"
-# This is specific to XQuartz, which is the macOS X server port
-CVE_CHECK_IGNORE +=3D "CVE-2022-3553"
+
+CVE_STATUS[CVE-2011-4613] =3D "not-applicable-platform: This is specific t=
o Debian's xserver-wrapper.c"
+CVE_STATUS[CVE-2020-25697] =3D "upstream-wontfix: \
+As per upstream, exploiting this flaw is non-trivial and it requires exact=
 \
+timing on the behalf of the attacker. Many graphical applications exit if =
their \
+connection to the X server is lost, so a typical desktop session is either=
 \
+impossible or difficult to exploit. There is currently no upstream patch \
+available for this flaw."
+CVE_STATUS[CVE-2022-3553] =3D "cpe-incorrect: This is specific to XQuartz,=
 which is the macOS X server port"
=20
 S =3D "${WORKDIR}/${XORG_PN}-${PV}"
=20
diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recipes=
-kernel/linux/cve-exclusion_6.1.inc
index 4cc151901b..be632dec2a 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -1,17 +1,17 @@
 # https://nvd.nist.gov/vuln/detail/CVE-2022-3523
 # Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
 # Patched in kernel since v6.1 16ce101db85db694a91380aa4c89b25530871d33
-CVE_CHECK_IGNORE +=3D "CVE-2022-3523"
+CVE_STATUS[CVE-2022-3523] =3D "fixed-version: Backported in version v6.1"
=20
 #=C2=A0https://nvd.nist.gov/vuln/detail/CVE-2022-3566
 # Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
 # Patched in kernel since v6.1 f49cd2f4d6170d27a2c61f1fecb03d8a70c91f57
-CVE_CHECK_IGNORE +=3D "CVE-2022-3566"
+CVE_STATUS[CVE-2022-3566] =3D "fixed-version: Backported in version v6.1"
=20
 #=C2=A0https://nvd.nist.gov/vuln/detail/CVE-2022-3567
 # Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
 # Patched in kernel since v6.1 364f997b5cfe1db0d63a390fe7c801fa2b3115f6
-CVE_CHECK_IGNORE +=3D "CVE-2022-3567"
+CVE_STATUS[CVE-2022-3567] =3D "fixed-version: Backported in version v6.1"
=20
=20
 # 2023
@@ -26,11 +26,12 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-3567"
 #  * https://www.linuxkernelcves.com/cves/CVE-2022-38457
 #  * https://www.linuxkernelcves.com/cves/CVE-2022-40133
 #  * https://lore.kernel.org/all/CAODzB9q3OBD0k6W2bcWrSZo2jC3EvV0PrLyWmO07=
rxR4nQgkJA@mail.gmail.com/T/
-CVE_CHECK_IGNORE +=3D "CVE-2022-38457 CVE-2022-40133"
+CVE_STATUS[CVE-2022-38457] =3D "cpe-stable-backport: Backported in version=
 v6.1.7"
+CVE_STATUS[CVE-2022-40133] =3D "cpe-stable-backport: Backported in version=
 v6.1.7"
=20
 # https://nvd.nist.gov/vuln/detail/CVE-2023-1075
 # Introduced in v4.20 a42055e8d2c30d4decfc13ce943d09c7b9dad221
 # Patched in kernel v6.2 ffe2a22562444720b05bdfeb999c03e810d84cbb
 # Backported in version 6.1.11 37c0cdf7e4919e5f76381ac60817b67bcbdacb50
 # 5.15 still has issue, include/net/tls.h:is_tx_ready() would need patch
-CVE_CHECK_IGNORE +=3D "CVE-2023-1075"
+CVE_STATUS[CVE-2023-1075] =3D "cpe-stable-backport: Backported in version =
v6.1.11"
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb b/meta/recipes=
-multimedia/libpng/libpng_1.6.39.bb
index a6c229f5cf..562745e3eb 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
@@ -32,5 +32,4 @@ FILES:${PN}-tools =3D "${bindir}/png-fix-itxt ${bindir}/p=
ngfix ${bindir}/pngcp"
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
-# CVE-2019-17371 is actually a memory leak in gif2png 2.x
-CVE_CHECK_IGNORE +=3D "CVE-2019-17371"
+CVE_STATUS[CVE-2019-17371] =3D "cpe-incorrect: A memory leak in gif2png 2.=
x"
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb b/meta/recipes-m=
ultimedia/libtiff/tiff_4.5.0.bb
index ca4a3eff91..c083acaa61 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb
@@ -18,14 +18,8 @@ SRC_URI[sha256sum] =3D "c7a1d9296649233979fa3eacffef3fa0=
24d73d05d589cb622727b5b08c
 # exclude betas
 UPSTREAM_CHECK_REGEX =3D "tiff-(?P<pver>\d+(\.\d+)+).tar"
=20
-# Tested with check from https://security-tracker.debian.org/tracker/CVE-2=
015-7313
-# and 4.3.0 doesn't have the issue
-CVE_CHECK_IGNORE +=3D "CVE-2015-7313"
-# These issues only affect libtiff post-4.3.0 but before 4.4.0,
-# caused by 3079627e and fixed by b4e79bfa.
-CVE_CHECK_IGNORE +=3D "CVE-2022-1622 CVE-2022-1623"
-# Issue is in jbig which we don't enable
-CVE_CHECK_IGNORE +=3D "CVE-2022-1210"
+CVE_STATUS[CVE-2015-7313] =3D "fixed-version: Tested with check from https=
://security-tracker.debian.org/tracker/CVE-2015-7313 and already 4.3.0 does=
n't have the issue"
+CVE_STATUS[CVE-2022-1210] =3D "not-applicable-config: Issue is in jbig whi=
ch we don't enable"
=20
 inherit autotools multilib_header
=20
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb b/meta/reci=
pes-support/libgcrypt/libgcrypt_1.10.2.bb
index 58f07a116d..524b06ca22 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb
@@ -29,8 +29,8 @@ SRC_URI =3D "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.ta=
r.bz2 \
            "
 SRC_URI[sha256sum] =3D "3b9c02a004b68c256add99701de00b383accccf37177e0d6c5=
8289664cce0c03"
=20
-# Below whitelisted CVEs are disputed and not affecting crypto libraries f=
or any distro.
-CVE_CHECK_IGNORE +=3D "CVE-2018-12433 CVE-2018-12438"
+CVE_STATUS[CVE-2018-12433] =3D "disputed: CVE is disputed and not affectin=
g crypto libraries for any distro."
+CVE_STATUS[CVE-2018-12438] =3D "disputed: CVE is disputed and not affectin=
g crypto libraries for any distro."
=20
 BINCONFIG =3D "${bindir}/libgcrypt-config"
=20
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.38.bb b/meta/recipes-=
support/libxslt/libxslt_1.1.38.bb
index bf35a94b7f..ed5b15badd 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.38.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.38.bb
@@ -19,9 +19,7 @@ SRC_URI[sha256sum] =3D "1f32450425819a09acaff2ab7a5a7f8a2=
ec7956e505d7beeb45e843d0e
=20
 UPSTREAM_CHECK_REGEX =3D "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
=20
-# We have libxml2 2.9.14 and we don't link statically with it anyway
-# so this isn't an issue.
-CVE_CHECK_IGNORE +=3D "CVE-2022-29824"
+CVE_STATUS[CVE-2022-29824] =3D "not-applicable-config: Static linking to l=
ibxml2 is not enabled."
=20
 S =3D "${WORKDIR}/libxslt-${PV}"
=20
diff --git a/meta/recipes-support/lz4/lz4_1.9.4.bb b/meta/recipes-support/l=
z4/lz4_1.9.4.bb
index d2a25fd5b0..51a854d44a 100644
--- a/meta/recipes-support/lz4/lz4_1.9.4.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.4.bb
@@ -21,8 +21,7 @@ S =3D "${WORKDIR}/git"
=20
 inherit ptest
=20
-# Fixed in r118, which is larger than the current version.
-CVE_CHECK_IGNORE +=3D "CVE-2014-4715"
+CVE_STATUS[CVE-2014-4715] =3D "fixed-version: Fixed in r118, which is larg=
er than the current version."
=20
 EXTRA_OEMAKE =3D "PREFIX=3D${prefix} CC=3D'${CC}' CFLAGS=3D'${CFLAGS}' DES=
TDIR=3D${D} LIBDIR=3D${libdir} INCLUDEDIR=3D${includedir} BUILD_STATIC=3Dno=
"
=20
diff --git a/meta/recipes-support/sqlite/sqlite3_3.41.2.bb b/meta/recipes-s=
upport/sqlite/sqlite3_3.41.2.bb
index b09e8e7f55..181187bbd9 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.41.2.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.41.2.bb
@@ -5,10 +5,3 @@ LIC_FILES_CHKSUM =3D "file://sqlite3.h;endline=3D11;md5=3D=
786d3dc581eff03f4fd9e4a77ed0
=20
 SRC_URI =3D "http://www.sqlite.org/2023/sqlite-autoconf-${SQLITE_PV}.tar.g=
z"
 SRC_URI[sha256sum] =3D "e98c100dd1da4e30fa460761dab7c0b91a50b785e167f8c57a=
cc46514fae9499"
-
-# -19242 is only an issue in specific development branch commits
-CVE_CHECK_IGNORE +=3D "CVE-2019-19242"
-# This is believed to be iOS specific (https://groups.google.com/g/sqlite-=
dev/c/U7OjAbZO6LA)
-CVE_CHECK_IGNORE +=3D "CVE-2015-3717"
-# Issue in an experimental extension we don't have/use. Fixed by https://s=
qlite.org/src/info/b1e0c22ec981cf5f
-CVE_CHECK_IGNORE +=3D "CVE-2021-36690"
--=20
2.41.0


