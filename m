Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22105C25B79
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 20:10:11 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.132])
 by mx.groups.io with SMTP id smtpd.web11.170831.1692216602317089389
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 13:10:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=epH6qnb1;
 spf=pass (domain: ni.com, ip: 40.107.237.132, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2s+TJ79heWC+q7NexsdjVA0FcHN9rg+73mPq25CeRol0h92iZs81i4br8K51lYUtR11nA6sv2wpXBeLmNssTYPp4PAOAQRcJ6m0fB+ZpwodEseovk//mWIoAI9eS9gePuywrw4dAqk8dZme2t1pV9G4ivNW8yiKNDm4eGPSbC85di3qlqy+iHWrfA9StQyn09mq5w55RXsxBvBfm+30xjzlPrvQpmPwrscfRnJBdZPaFToWdh7VJWXQEXqm3pbIsW4EpivMyKoenCiKFpvdK5CjdHecyKb+43Abo0CHVKC0LjekFzQgxBUB5s1LsgSwj6zXkxTeA0J21iJhnHXCxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZRLn6ZJv4gTdR2Cjmhe9F0lB9WmudVLZUIdQDIqkLE=;
 b=Gw2DMVwBivuVDwUfkZxUT7/8I1hr1iNiM1S4Xwqka9HLfJJtNnJ4pqflTwcCAjp8FUz+udICRuA/HETsk/7uPMad7NCEaQlqbfhI+TbkHUFrm/t2KnFhMnvdJZtyhlLIJS5DFSFNJRDNlVfS33ROmXs+/+QZzOhUtgn9fYSJAPQ2PeEFbonGqH4ElBFRyVrjQ8yQyEDyTbAc5V/KzcI9fbTiB5wHtG6bGPnRwhBSF7XCfvoq7/k3UlAKHwjuHZyZJe0qaD5ViIeMQ0yLRkBpllcwFzHbAi76bNQr3o7Kh1MJ1J87Tkmthv0fiXy8L48cWx8B+eHS+agONgTb0D+2uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZRLn6ZJv4gTdR2Cjmhe9F0lB9WmudVLZUIdQDIqkLE=;
 b=epH6qnb1vnJ0XerQSOXu6UhxKCye+7MDxYA2jBlh3MJKpjXbmBblm+RbkKU/QU5/pzLxB566ryG/KHRgx9jyezgl0w665dVbei+g10j09frnhrIxtDpunRNfUsQ3mhEfqB0+k5JmcWsIfjadkCJju/16QpwyoOu8ae7xB2wJJ/s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by BY5PR04MB6963.namprd04.prod.outlook.com (2603:10b6:a03:228::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 20:09:59 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11%7]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 20:09:59 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [oe-core][PATCH v2 5/7] packagefeed.bbclass: Add new bbclass for building feeds.
Date: Wed, 16 Aug 2023 15:08:35 -0500
Message-ID: <20230816200931.2577181-6-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816200931.2577181-1-charlie.johnston@ni.com>
References: <20230816200931.2577181-1-charlie.johnston@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DM6PR03CA0099.namprd03.prod.outlook.com
 (2603:10b6:5:333::32) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|BY5PR04MB6963:EE_
X-MS-Office365-Filtering-Correlation-Id: 580ff72d-04f0-4814-e881-08db9e94c4a0
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KOgCHZrbuT6P6TC4VUO+ZdoM9NSP2PYZcBbom5JmiN1PwslV1A/DPbao3u8ltE0XzcsXu/U91oQSl10rhAHRsv/5Nv3uWD/gF4EDN8Vv01BPO/Hkrpt0Q8G3qEmRAuq4SdQ6clyp1JrQb8QxCO7OlZ7TdJw6EMKMZ3vGT4JbXBjg2/A5K/4LHNoHQObeR+RRGuHF/vWDv8CIPgKQlbvx0E7qVOAZDsYVf79L/V0D86I9St13es8rQxUwgsfbcFqwgC7maamMx8neqS1f8RG+LzOWreeZzlSyXxB5BlQ3wFuYcOBkNYlTbdBzDorCkK4tZM3SNOnMqItcNlNY0IQVtSEcQX+v0UCqJctcCyv+qTTbobFoWAQUDds+6J06sOWG1Ocu2N1tR8a9vjDNCVCwHyAewuy6bwr5nCgCoLLTFpCpR5pxUDOuoNZ3mxmqcu+1aZG+6xb9IdlFyxmFf2rPetl/Q5xHJKpqma7J8G62J0kFRSnRKahD2ZKCJZWiN8B6pDV9rl3yoEg/4yD6vK4TUM5wmTKJ/sfmgPYHNw6pw1yzLhSM4207rFlxQI9DrG8X
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39850400004)(346002)(136003)(366004)(396003)(451199024)(1800799009)(186009)(316002)(6916009)(66946007)(66556008)(66476007)(5660300002)(41300700001)(44832011)(38100700002)(8676002)(4326008)(8936002)(2906002)(26005)(478600001)(86362001)(6512007)(6506007)(36756003)(6666004)(1076003)(2616005)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JLqa/+DuA4DbeHrbMf8DSdE2IHaDh2aLuvPuDCYjJrff1sJi4GnCMPQ7cQUx?=
 =?us-ascii?Q?+yARd10WXPzI/aMc/WATPdrbC4ZyBWPmzcPTFq+NedpyPk5gqIHaCuB5MQ2R?=
 =?us-ascii?Q?+tqJ6uMkpa7VOOjv94eCpLfsF6zTowOkOwZph7ZfZVIeJofRSGmi9tU4cjD+?=
 =?us-ascii?Q?0OIAjxvEd8AGO9nddKYlhmYU3+wIq8EXklwv5b+MOr7tIiwSLbVXtMTtXnv7?=
 =?us-ascii?Q?xEJNFX5rINAIxGnJbzSevAZCYL+F+T9zCK0EGYvWAPwvEZXYvhimIhzCTq2Y?=
 =?us-ascii?Q?Pn7lFTudukKiLf4+q3lty21qakeDA7INLSYMwMQwINbPegW8Gxlb3qZFTfeU?=
 =?us-ascii?Q?T7m2gVIiiWMXca0jnns2e/JMsnXuOsjApH9QYhlLg52I26jdAIMKXdeWGJn9?=
 =?us-ascii?Q?1MIwyepmh8OJvzFEfQ8JYns9JvGoyIpabQXHYLAqNg+vFDv+OEtWgUiv7fzo?=
 =?us-ascii?Q?6kf78UC3It0fYNg/o2UIP3OGFAgoV7e3orIcrUaDWdhAVZsOD7TOwIzBQamQ?=
 =?us-ascii?Q?qLjEqbbvKxIM1NGyH9Eed3qhZNJmtxJlhuZ/kBNT3q/taVy1S+mURDjdRIvK?=
 =?us-ascii?Q?pcaC1/TVuNg6URP3FUYOovtP9FM4LGjaibGVODW55tOf3ZGBqbe5sSAfiY6m?=
 =?us-ascii?Q?gJQMG1/luUukYN44ugccFvZE6/qJbiq852jBxE8KDTa9lDGXIZocYLqKbcXa?=
 =?us-ascii?Q?Q7NqDnVsN9wGl2ngsFpV5riv7/o5tms3uxYgTDYlvTp4zPWid3d1MMnelaui?=
 =?us-ascii?Q?myT6TwTIyOIucA/ILlwlLWa521IByZvJR/Xg542CU88EVjkUJntniLl3oZAm?=
 =?us-ascii?Q?slP74zXlG9f3QFluIwR/D2GpXQwU77C0WfuAwZ/Jt9y9k+wO9HXGPng25EgE?=
 =?us-ascii?Q?sG8wrqQin2u5NgMmpJb8ZBWwH7mezjcr5LZ+HZ6n0zKbQY+jrAYS8AwlGyTU?=
 =?us-ascii?Q?6Ecw9h4lOs8XC8SAPe8ulhtk2FpOnuHw7yXvB7d+exvSNiXx1iHwFGpU3hGg?=
 =?us-ascii?Q?HhMrzLmkvoQKp5TyS1VJtlvfqdFXFSoLd/6Njye5sYq2SjsV+/AR9i2GtRke?=
 =?us-ascii?Q?qa19ZuRw95gDaWcTLJ9MEg6r9jP06FWNBgIqrXuHHAhxs5D+o7DB36md82z+?=
 =?us-ascii?Q?TaCKLN4ln1ItqTcHJ6V7Xze8fVkjy1jWrltNvi7Bx1dN6RmejuhH/05iJRP5?=
 =?us-ascii?Q?f2DkqufS25KKlIbHzHsZ7Sihxo6MnT0vx14I768ru9QoZYl2JcF8naEtMNyJ?=
 =?us-ascii?Q?La2raGLPWTMXi5mIi9tIpmTZX761185K1LcwQsWq0XMSe7GVjjZIwgA76cv/?=
 =?us-ascii?Q?UJwOGoyzBbSz+MZY3Dv/pTzJqLVIQsvwAkcEaA0TVLyKbGeQ0+1+BGxW58iX?=
 =?us-ascii?Q?3/wMoNFWvoRySgEfUAcqDi0awHLdHe0txrquZa+DBhapTwDos5FOPiLvfhoi?=
 =?us-ascii?Q?qyOpnTPPnN2PinFfK5MdVGaO6i111gFIxZt4IjoXMikQJp8uDju2jpgCSdhG?=
 =?us-ascii?Q?97xsulwBpPe1u0u1QVvDp5RJQYxM2mKTe+GPyPtfxor7SM9D33vTa2EX9y4f?=
 =?us-ascii?Q?u/vA6HFtvnyV47VabZN22zXt4GjIWMqKWy9+pOMSXEh8Dewrg8b4i4W/FV/A?=
 =?us-ascii?Q?EA=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 580ff72d-04f0-4814-e881-08db9e94c4a0
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 20:09:59.5933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QiMzpQmiXoCHObjsvF20SpO2r49fMBsAVDoSeHMMe5L9Z1n91eXU4P7sILJ+uDjlT90JcLFNMmgxpxzl3EN/9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6963
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 20:10:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186148

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
index 0000000000..de07529464
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
index 0000000000..2decc70a4f
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
index 0000000000..89d296200b
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
index 0000000000..8ce37cc855
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


