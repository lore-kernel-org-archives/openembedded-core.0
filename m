Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5331C00528
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 21:40:53 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.127])
 by mx.groups.io with SMTP id smtpd.web11.573.1691012448925498502
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 14:40:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=Svt0+CR8;
 spf=pass (domain: ni.com, ip: 40.107.244.127, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=asjZcazQbnu/DI+6u8FOp162vbA3UGhgUPWNjZPWNMxXSVLqe8Ljx25wmxPcf4a1Q2EQQBCV0YGbYNPAtoVtuHf5FgZbAt2OyBpZQ57QC9e1JvGNro9dh+d2LuNoRfnu8snxbfU2KzqIud/swfA+X6EDSGF8yq+HDwv/GU9dRTi0ImHaGCZCQzt4Wdh0QI8pFwJjEkaxdwvYF4C16YZgEUveMdFPV3Vo8WwqEmY3bQfspIGNih8+2jX67JgvBu8KuniHpFbIcp2mMJwKgzaX9cKWHVQnmBNEro9EtrjE4YiuATQAfDTkAriHViedLYFtVqQ7G2Qilyra+1cdO6Jakw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pa1VtDkPys8LJ+xwU8hizM36gE3s6N72nNXFPu4yo38=;
 b=gQPXh22AhR/T6v3q0DSsJBCt85EG+U1WzuP4aCBWgIlAFhfCFuWWisWiyrbadeKlQgawJHoiEyjppaSb5ymbsc7hzivZsop/MTe7ENNq1jq7kPuGjjxfvW1gpvl7NqR3h6B4ocrtUjPqJ1i8bc9G0xYBCwnuVWRGfpG5C6UfUxoNUCqnp0/RW0+ONHGTrqmewlI3PugIlONCoU0kSINUsekI5qz8nYQZ18mue6cke/znlEgiv9gv+Mg9/TXj01gRQYK9TEZWNwau4+9I4YZr2VAmxSPKshFa/wLJwvznRT6j0Z1nLUnoF5ABcb9Wlb8qxk3QuajCYPXdzF+Tzv5oKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pa1VtDkPys8LJ+xwU8hizM36gE3s6N72nNXFPu4yo38=;
 b=Svt0+CR8PzPlHoWpJucqMD1DatrmW3Ig6QB5MQaSHLoNy4Zmh8/u+lBE8YOvW3bA9bm7t3vCVtMM52MExZbqhmQordVw/hNGKk5siL/wEuoQDxp4zN+/yEtqxJrVvPZWQuYBTxoIr5je5wu6PAeRLDt/L3lsuz2l0x5EdxcB3fM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by SJ0PR04MB7294.namprd04.prod.outlook.com (2603:10b6:a03:294::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.19; Wed, 2 Aug
 2023 21:40:47 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11%7]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 21:40:47 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [oe-core][PATCH 5/6] packagefeed.bbclass: Add new bbclass for building feeds.
Date: Wed,  2 Aug 2023 16:35:09 -0500
Message-ID: <20230802214019.1068795-6-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802214019.1068795-1-charlie.johnston@ni.com>
References: <20230802214019.1068795-1-charlie.johnston@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SA9PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:806:20::9) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|SJ0PR04MB7294:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d3764f6-a87b-4f6a-4b2a-08db93a12223
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IgPTVe6zCvvMPTP2FXFPONulbY5KI/vkG/Cijz3bIDNcvoAKpOtJqvOGhDSI4Xhcqv4ELgTs/U5af2gpYpx8PqM6E8aUdyXf9aE9dmcn1ZH4axx/MIgI2zWZAnHvsMKFX14lH152YXFfsfiqOVhnHqmXMzH9HWG4XwZzqUZqWZYVx8hmD92MVZwh4U0+yadAMtOISCsTMBYlDojEjRxJFJaOwfIoV1kEGxsM3DeRtvqqz3sAXFRplU7Ciqx2ytM535BiNEsncmgd2EYJ2q/i+QwXI79IHtvhof36fwp+OBdJX9mNeXj09gMM3gXbGf0IgctPNjYcRycbVY7HleKmrYxxju6tm4hzb4D+Grai58JSTx8aVI73khFdnh7BK5eT1aB71durnNc7lLsEVSOy5d8OrTH2yURoLTjgc/2IH/RI44hiWBtqS+V9LJj7paJMNZpcJ+IMuRumrPHF/2gPIVs0LKuphjIUIftG+htE/Bi/wGNOdv05MjSE11S258dJsn2wyefsxnD0na0yrXo7FEhZRDRps0wSR7xyr3YLmJ8z6LnWDmCpjeVybu4svAtZ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(376002)(136003)(366004)(451199021)(8676002)(5660300002)(2616005)(41300700001)(38100700002)(316002)(186003)(8936002)(1076003)(6506007)(26005)(4326008)(6916009)(66946007)(86362001)(66556008)(66476007)(6512007)(2906002)(6666004)(6486002)(36756003)(478600001)(44832011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?S94LDe/HGNtIef2l+e9+2ZeqZsPWuEwXspspklhnMW/33sNsplOPCWKwehmz?=
 =?us-ascii?Q?eMeB+j+umH6VufgCRB39/OniTKj36OfF6O3NOpMR7x0u/VkSb2es/fmE04A2?=
 =?us-ascii?Q?/5ElIir5KI9TEmXfR3Iac8wWtgnWI8ppWjNbfi1WBUeKWs0FFGILU+sMt3vx?=
 =?us-ascii?Q?CZ8qvYDl4tb8AdCBmxkcKou1LquY0eW87ZDlGlVMPTA25PL/72hbos8vSQKl?=
 =?us-ascii?Q?rqL1I0r1SN7qYIoiQ/1zLXQSv2VxVdhM7Tqxt47gjEwTF6wCClzJpupMcTqA?=
 =?us-ascii?Q?Umzg6b6YYY91f3NRhiaa8q1EzoOD24QolS1Bc9kt7uURt6eYBW51ERXG+jII?=
 =?us-ascii?Q?J5KbTmeP0S8Psdy+DYMqUed9vDzISxCxpl1euCK/sme1Geknt75dESbSHfIm?=
 =?us-ascii?Q?AZSgnfzdGhNW583ziM9CyChLNv0cIvt3S2tLYaLnVRKLdvUTCsr/hcL6mYHt?=
 =?us-ascii?Q?SY9wmBjCOo/cZoDP7vs7J0pdUjZ2Dl0RsMJT1dWbXCMQSugsNkXfx9sKwbhH?=
 =?us-ascii?Q?lC+wMYdhLEiJwvuKePO9uPhpoJ6rKyRVKiAzAbsLo8y5285j8S1zcDt9Fw3N?=
 =?us-ascii?Q?LBk1ovgvImiEhwYUM7zON7soRAFJ1xFIaYYBibelgZVa7F/cCNzoxekvNdee?=
 =?us-ascii?Q?qnsiCeaU/WkbYeI8B9cZD7iLhw5IIPR+KyNVRw+GzvsOc+BErU8UdGYhbA7y?=
 =?us-ascii?Q?JgSSQwOb30j7yE5UaIDw/zl8QeNwBDGitrMZFu0hoaupQSDR9jZTvuu1PzvF?=
 =?us-ascii?Q?unqI6kxCHFHVNg783r/m7gffNCpJnJM4uWL5JJtvbtFoZSNnL+n8XGU75Iqy?=
 =?us-ascii?Q?5u+SyHj0zfl2mOl8ZtjMEhDE2wqfTsCRoRgF51ctrXxVoQZmTNMF7WTAckBN?=
 =?us-ascii?Q?bbQ/d0rXCsEp4LolZxtPnHV2lmQUm3b5j5i85o3KK0gdbs0QqmDQGxmbobPi?=
 =?us-ascii?Q?tQegdbtLmyl9g/US4k63bcvIWud5X/+why9PlekgnWUp4qP/N1Is2PItFNNi?=
 =?us-ascii?Q?VkPw6mKSv3od8qck60RQYzV/eYAcBMSHL8i/rH152PesCDuhcBq7kod4t2X6?=
 =?us-ascii?Q?ENlJiliVTCTnlahWcrP2Vp03JFh7YuYZQhHCn1me90jvx71OG0QYEjqrBnSt?=
 =?us-ascii?Q?nKLLM81wxrT6ygSRs6NqbgBnquOJr6JyWSGoPn1/o4ytUe+szGCcJS9W1po3?=
 =?us-ascii?Q?dOUVYm8OkAIlKvJHBIpz/0Ag0Kk/7n66xR6qfIpMXZTmUretpmAL++CSprZB?=
 =?us-ascii?Q?i48B15CsrkkmU+ZR1T1CTpMw7wOIAVknXVuL5z38ZZZ5T5KahovT4W70+4Gm?=
 =?us-ascii?Q?jKKw+nhazO46CzHoIgou4+IXf5A2W9tWruOD/fhlIQpQwRhFuZTCrizK0UTf?=
 =?us-ascii?Q?m9x/XKVZw61P5O/qIlWfzg1BVoJ7kBKGZ8mePEKY2YBBTUzyRevBSVeNKAs7?=
 =?us-ascii?Q?c0+JpVm5rwgzCmJSQZAtSNdN9++GV9NQb10W8JXEEwZdqY1LYAXPshGTC8Ky?=
 =?us-ascii?Q?D19xneBalWu9NiF0fTQeRWaN158fXXkoYquQNFMeJWIS29bu+FV9ZgTyhh+u?=
 =?us-ascii?Q?QlfMGkNZmQXCvtsdQHD7J3iAmZhWMIdfgmWPSbUFNuuZIomxOQqgXEQyE0WV?=
 =?us-ascii?Q?LA=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d3764f6-a87b-4f6a-4b2a-08db93a12223
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 21:40:47.6145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wWkuR1PA1t2YtakUSYFSTAZs3aU8l+cVjjWD8krZsOwI68AsbYwkv1J+WXh3I1+6GPpoHn/hjognlFtcW5SZwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7294
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 21:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185439

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
 meta/classes-recipe/packagefeed.bbclass     | 26 +++++++++++++++++++++
 meta/classes-recipe/packagefeed_deb.bbclass |  8 +++++++
 meta/classes-recipe/packagefeed_ipk.bbclass |  8 +++++++
 meta/classes-recipe/packagefeed_rpm.bbclass |  8 +++++++
 4 files changed, 50 insertions(+)
 create mode 100644 meta/classes-recipe/packagefeed.bbclass
 create mode 100644 meta/classes-recipe/packagefeed_deb.bbclass
 create mode 100644 meta/classes-recipe/packagefeed_ipk.bbclass
 create mode 100644 meta/classes-recipe/packagefeed_rpm.bbclass

diff --git a/meta/classes-recipe/packagefeed.bbclass b/meta/classes-recipe/=
packagefeed.bbclass
new file mode 100644
index 0000000000..08df96f662
--- /dev/null
+++ b/meta/classes-recipe/packagefeed.bbclass
@@ -0,0 +1,26 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
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


