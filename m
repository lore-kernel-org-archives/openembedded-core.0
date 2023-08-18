Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE86EE498B
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 17:48:30 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.107])
 by mx.groups.io with SMTP id smtpd.web10.870.1692380902016658356
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 10:48:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=idAJ6/Em;
 spf=pass (domain: ni.com, ip: 40.107.93.107, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dkW+1bGpv67iinTSlmkQEk7QI7I+TOefJ8s2NlrBqALWsyoJj3S2/x8MGP8xZKO39imLSFrxbFzozOUiAKNJ6TGe35wUW7jqiIF85Qd2eeJNPfo16oKuKoDuHYLffIAZjUxudUaexJRg6pRf2VF2InMqCvTyiZ4kb8lyjLM/qRnHePPUomyhzujGe5xc/9X9kw/4QtN7bJnojP5hEkIIdPb/ASN8CY7WeR7/XKVfZz6Bb15VCerz7PSHPJZCuqjRorftSrTGGbYYg+bBvceP2PB7eFsUwReLIY321+maMKKR4Ounluq+dcM+ez8KBtSCtrZMSfUIjH6sBTqEtVAA/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3z4Ofr0JQVdNfDEpAXf+g8YEEVnPxcMYBclG6MOGo0=;
 b=X+8wOwIO5K6nl2m4Fu38R6MAgjF4kPryjqQ4URu1ngBcjX1tk/xkwKOzuTv3uGARM2Cp2Bjd7/cEki2Pr4qX5HEMfaphv6Grp4rwoA6UL4s/ZOnwl2yoWfNr490SGPpRsWUL8rLMdLzJI5VZTW8mb7RPcbdyyXYsEJtmdY0Z3apvkZbW5rkxfUyYQjGwpsyJaYaRJClHOmGGS6hxWlRiTcV/94PPhzo/lud726daMaz8Hpty39fTJ/lRxJHM0jiVK+CilD2NJtiJED98wHc/ecrngzUROXjkSmFv4h2I/Xgrwzvq90qfzd8wIQfrrRht7pJO+lyMs2QP2kMIvVOR/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3z4Ofr0JQVdNfDEpAXf+g8YEEVnPxcMYBclG6MOGo0=;
 b=idAJ6/EmBR4C+L8aJ5ShtdBCiyMSE3k0AKK0bGm1kt2ajnjNSEaaJ8eZHJxx5j/jym7VKXqG+y8r1l2FAOZGLhbcpilCYGruXfZHRpNFK+d4nkK6JJqEvSDNyJ2O0RfcPsT91Hh4+DXXOYMzwaQxK6xVKgwcDlEgHum0x5IRkcE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from BYAPR04MB4870.namprd04.prod.outlook.com (2603:10b6:a03:4a::15)
 by SJ2PR04MB9012.namprd04.prod.outlook.com (2603:10b6:a03:563::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Fri, 18 Aug
 2023 17:48:19 +0000
Received: from BYAPR04MB4870.namprd04.prod.outlook.com
 ([fe80::9f2d:5e4c:747a:6add]) by BYAPR04MB4870.namprd04.prod.outlook.com
 ([fe80::9f2d:5e4c:747a:6add%5]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 17:48:19 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [oe-core][PATCH v3 5/8] packagefeed.bbclass: Add new bbclass for building feeds.
Date: Fri, 18 Aug 2023 12:44:54 -0500
Message-ID: <20230818174754.988128-6-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230818174754.988128-1-charlie.johnston@ni.com>
References: <20230818174754.988128-1-charlie.johnston@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DM6PR02CA0120.namprd02.prod.outlook.com
 (2603:10b6:5:1b4::22) To BYAPR04MB4870.namprd04.prod.outlook.com
 (2603:10b6:a03:4a::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR04MB4870:EE_|SJ2PR04MB9012:EE_
X-MS-Office365-Filtering-Correlation-Id: e18f5939-81b6-4e46-31a2-08dba0134eef
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GJ9IBneEmVQski/MGPShCWl9Ie1YiJvXmsAHGr8GeoS4X/RJav8h9fbIv5tXtuW/MiBnOZz2dQEpxZ1jRXUa/fQWXWFavKwQJ3iOjdQhSIHJNEIuFX4+tbabrzO8J0Wjo+p9uB/ysQCJjmSmI6LEdBQ69yyoxJNCghB2sfcvXaNdEZVqrw7DMPFIng90fmatBlgS6xBl0a5xVwnVsFwt69OmYBfPYv5+Md3ibkGoIejJPlk5KpJyG3FpLHlujyUV2/j9FGLyzZtMb7Ma+EmbkbOQR5booL+eXCuXDfroj0zOAv79tcAguPiBaMDMmRZG5Y2Ms+VjCKlKFR5Nvdj9K3mtEYbH/ejy75oKlcKzrVy6Sb9BYGV6YhO1GsvkRgUcbfaLV4reNYwjkYdeutNrbD0ov4jrCmfnC4wzs+YqLHVdypgX4rCmfuV96IlVDswRVhDB9/7R0Nd+L9gszU7vZA6sY1argR9cjYwpoNfbIAwuflZySFHVKZJG+v5Nho9U6PB2T7fdjLfpmrJTzQML1eCQ2joFnba7OCTULvVkx2oXdkRZkqfb5jLARyTc74gb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4870.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(39860400002)(346002)(376002)(186009)(451199024)(1800799009)(2906002)(26005)(6506007)(86362001)(478600001)(6666004)(6486002)(2616005)(1076003)(6512007)(36756003)(44832011)(5660300002)(41300700001)(66476007)(66556008)(66946007)(316002)(6916009)(4326008)(8936002)(8676002)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bx+YmLiUebN4f3X4KHx+QLpHLdHMu36CTsI6eJ3RYFtw1/Hf7Uc6ijNddmEu?=
 =?us-ascii?Q?9uKMBoSQl3yFl9+STqmbjmJLlVKUV4MniK9+RGNKWsAEvvzGUYJgnPmlG2mN?=
 =?us-ascii?Q?LNx3R0NDIMUIL3seuDFYb/azLyn1TZ8cj1mdCeNQS6EkvxxWk7AE2NWOhCO3?=
 =?us-ascii?Q?U35OmqfCiB5QoC77j6pRG9IMK7jeNR7VnbFtG0YEQliayhB+2hdrkutlUPOg?=
 =?us-ascii?Q?H5SybSSrsnC0zITliKwZ4bGbW+A/UWdMMWSUvvXANRHgLZ8UIvqDFDuNGRf6?=
 =?us-ascii?Q?0daPabP7l1Xb3Bd2kbo/spT6f34UvTDZyKfKVSAT2zXX9Z5c2HQ3AVOdOtvP?=
 =?us-ascii?Q?woRtH7IZUxagquE8i7506veYUYaxNEkN2JVB5pojPye8sUYmZN1uQ1FV/Tay?=
 =?us-ascii?Q?yiCfAnIOFrDPngg2ZivzeUqlOxQWnVjlqFPMxpi1wuumtZ/JVuT4WH7u71av?=
 =?us-ascii?Q?2atIUcxi8unyZKc2uhbHm3W6+s2fA+5GUgZmImd910Cn7FvwLXguTnGkINqT?=
 =?us-ascii?Q?XSxdF82s8GFQXTYknX7gLUeounB/IU80au8HCQWgjqit85L4h3iJ26I96Cju?=
 =?us-ascii?Q?RaiwpMWEdSYve5PXKVBt/K0iNF/HQzy53BZlpbfin7NktN8cFdrMSnkk1DkH?=
 =?us-ascii?Q?VtuBdgHA8g2FC8JyzmOwmtNCRsr+822BS5POyRL76gVzqgXv566hTbBT6wzG?=
 =?us-ascii?Q?XmZGBXr/+9xRI8xFZ9HpxhGancqm+Esuk0WuC9SdA6179CxjSXSKxm+AyAyU?=
 =?us-ascii?Q?qL3bL3D9kADn45kiUlmNWe0uYS93c5xCzma0pxKcotdJ9bAPKtydsbMiA0rG?=
 =?us-ascii?Q?Oww1uUH+bta+ZMlB6ynIloxP3Rv8RKm0U0vLoiAFmknX+IrI+rcVDmTKHdAb?=
 =?us-ascii?Q?K7jqpHvZEp9HKvgC9F+qXt0ht/tGBJBK/CpD78xV/rDykYWJTMLlLU882tbC?=
 =?us-ascii?Q?QUd0B/dmuknUOVnQJSYpefR6V4dLnr8dUYAMZB41ulkGxVGOAw5CpCwL3WN3?=
 =?us-ascii?Q?eHg4r/R/+E+DqmzTsS60v+MaeMuXtUybIQXYTQoTHyi7XP1hM8o9IoRVoa17?=
 =?us-ascii?Q?IEewH+jXhx8l4J3Www5FjSAw5Jx0cBcqzUDMZPqgblhLLl1/QLjR3ADWnbfL?=
 =?us-ascii?Q?PcwX2/PrPH0rjO6ysdltD/G5aXlNBWs6u8hUiCGe5knKhkbq6rLFxlL9OIKk?=
 =?us-ascii?Q?EJHqk3gvwUu2Qu2/sfpW3mOOR7h4BzOPRli65KeN+hXfgmjuVxoH3Qy3rnNL?=
 =?us-ascii?Q?8cqs5JOZRTP7wWboESjJh7MFzZN8jb5Z97y9au/5Evj6spSHzqAf+nvsk68O?=
 =?us-ascii?Q?0V9LUlJxbRAUraalt/ruoLEcGcfJ5v2sNjPcao90pBbP0elRldWxBfY9W4x2?=
 =?us-ascii?Q?be7QJ8jY+Z/2PiWYmRlVusjzA3LJ/CUWkqsPFRtl7rm5/nEaL1L0L7C859ZQ?=
 =?us-ascii?Q?F7HhTvqN7zHdSbm7NfiakEoziLmOfWY3qV5eoA3R7LBFkDsZ/KjJS9Ygrc/Y?=
 =?us-ascii?Q?HjQOuq0Y0uqRYiDQFAIS1kmQQ4uMfAbP5hJfuCSJpJFaHz/ETyHGcrOT4TpY?=
 =?us-ascii?Q?JOI/ET3mjAi4sUsS38e6VZvlTwqW2wqrDVrwHaNRK7OmXy5jer6Re9DINvMh?=
 =?us-ascii?Q?Cw=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e18f5939-81b6-4e46-31a2-08dba0134eef
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4870.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 17:48:19.3765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FjTA/BxdfIxXgwa177z/RO0LbqCQeo15fxmVLWnhHbN+VYPd6wcBYCIJ2D32gaBaKk4oHcmH2Ei7ZOcT4Upm5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR04MB9012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 17:48:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186388

Add a new bbclass that allows building a feed using the
new oe.package_manager class. Additionally, there are
packagefeed_<type> bbclasses to define package type
specific configurations.

The do_packagefeed task currently does no use SSTATE
data and is set to always run via [nostamp] =3D "1".

The variable FEED_DEPENDS is used to specify feeds that
the packagefeed depends on and will be available
side-by-side. This prevents duplicate packages in the
two feeds.

Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
---
 meta/classes-recipe/packagefeed.bbclass     | 50 +++++++++++++++++++++
 meta/classes-recipe/packagefeed_deb.bbclass |  8 ++++
 meta/classes-recipe/packagefeed_ipk.bbclass |  8 ++++
 meta/classes-recipe/packagefeed_rpm.bbclass |  8 ++++
 4 files changed, 74 insertions(+)
 create mode 100644 meta/classes-recipe/packagefeed.bbclass
 create mode 100644 meta/classes-recipe/packagefeed_deb.bbclass
 create mode 100644 meta/classes-recipe/packagefeed_ipk.bbclass
 create mode 100644 meta/classes-recipe/packagefeed_rpm.bbclass

diff --git a/meta/classes-recipe/packagefeed.bbclass b/meta/classes-recipe/=
packagefeed.bbclass
new file mode 100644
index 00000000000..de075294645
--- /dev/null
+++ b/meta/classes-recipe/packagefeed.bbclass
@@ -0,0 +1,50 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+# Class for creating package feeds with indexes for a group of packages an=
d their
+# dependencies.=20
+#
+# When deploying a package feed or repo for an image such that deployed im=
ages can
+# use them, it's not always desireable to include all packages in the defa=
ult=20
+# DEPLOY_DIR_<PKG_TYPE> directory in the feed. This class allows specifyin=
g one or
+# more packages (or packagegroups) to define what should be included in a =
feed and
+# creates a feed in DEPLOY_DIR_FEED with only those packages and dependenc=
ies.
+# This allows for creating one or more feeds at once and removes the need =
to
+# remove unwanted packages manually before an index is created.
+#
+# Example:
+#  inherit packagefeed
+#
+#  RDEPENDS:${PN} +=3D "\
+#    packagegroup-core-buildessential \
+#  "
+#
+# Optional variables:
+#  FEED_DEPENDS:
+#    Specifies one or more feeds that the feed depends on and excludes pac=
kages in
+#    those feeds from the feed being built. Used if a feed depends on pack=
ages in
+#    the feeds listed and it's safe to assume those feeds will always be p=
resent.
+
+PKGFEED_INHERITS =3D "${@' '.join(['packagefeed_' + x for x in d.getVar('P=
ACKAGE_CLASSES').replace("package_", "").split()])}"
+inherit ${PKGFEED_INHERITS} nopackages
+
+LICENSE ?=3D "MIT"
+
+# Feeds listed in FEED_DEPENDS and their dependencies will be excluded fro=
m the feed.
+# This allows for side-by-side feeds without duplicate packages.
+FEED_DEPENDS ??=3D ""
+
+fakeroot python do_packagefeed() {
+    from oe.package_manager import generate_feed_dirs, generate_index_file=
s
+
+    generate_feed_dirs(d, d.getVar("FEED_DEPENDS"))
+    generate_index_files(d, isFeed=3DTrue)
+}
+addtask packagefeed before do_build
+do_packagefeed[recrdeptask] +=3D "do_package_qa"
+do_packagefeed[nostamp] =3D "1"
+do_packagefeed[rdepends] +=3D "${@' '.join([x + ':do_packagefeed' for x in=
 d.getVar('FEED_DEPENDS').split()])}"
+do_packagefeed[cleandirs] +=3D "${DEPLOY_DIR_FEED_DEB}/${PN} ${DEPLOY_DIR_=
FEED_IPK}/${PN} ${DEPLOY_DIR_FEED_RPM}/${PN}"
diff --git a/meta/classes-recipe/packagefeed_deb.bbclass b/meta/classes-rec=
ipe/packagefeed_deb.bbclass
new file mode 100644
index 00000000000..2decc70a4f7
--- /dev/null
+++ b/meta/classes-recipe/packagefeed_deb.bbclass
@@ -0,0 +1,8 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+do_packagefeed[depends] +=3D "apt-native:do_populate_sysroot"
+do_packagefeed[recrdeptask] +=3D "do_package_write_deb"
diff --git a/meta/classes-recipe/packagefeed_ipk.bbclass b/meta/classes-rec=
ipe/packagefeed_ipk.bbclass
new file mode 100644
index 00000000000..89d296200b9
--- /dev/null
+++ b/meta/classes-recipe/packagefeed_ipk.bbclass
@@ -0,0 +1,8 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+do_packagefeed[depends] +=3D "opkg-native:do_populate_sysroot opkg-utils-n=
ative:do_populate_sysroot"
+do_packagefeed[recrdeptask] +=3D "do_package_write_ipk"
diff --git a/meta/classes-recipe/packagefeed_rpm.bbclass b/meta/classes-rec=
ipe/packagefeed_rpm.bbclass
new file mode 100644
index 00000000000..8ce37cc8551
--- /dev/null
+++ b/meta/classes-recipe/packagefeed_rpm.bbclass
@@ -0,0 +1,8 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+do_packagefeed[depends] +=3D "createrepo-c-native:do_populate_sysroot"
+do_packagefeed[recrdeptask] +=3D "do_package_write_rpm"
--=20
2.41.0


