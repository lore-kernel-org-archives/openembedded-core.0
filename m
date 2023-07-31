Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8042BC001E0
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 21:53:41 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.135])
 by mx.groups.io with SMTP id smtpd.web10.5469.1690840415263954268
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 14:53:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=FddCXo7x;
 spf=pass (domain: ni.com, ip: 40.107.94.135, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3Lx7W9L/PME7hdn5vPFPyutdlMAu18oibr9tFtq/wQ4barSw+HMSoYSsjKyO4rX38xUTt94TJbogzFoQgjmLYmlw8vM4jECJpYmMyPcxPTngUwmV4IyxNcn2JOh+DBagNrcJwDCg/Nf1HHDP5t25tJ7inRcaYdFT4aMtzThDtMMt5nrGOd4z4VTFleGe7K79vhHcQ0Mdk0DwTqFxAjHD2gJxCIJ9r3YQ3v0MEsbfLDsrsd1poAU0bR5Ap7XOtLOrLMRKKCWzOQdjPkdllZcvKUIbhSo57gOBSYUw/6isnZ8HrLpdk5X5PC7S5YI12app9RgMVQhg8lB+GaG9CN18A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8WA2B6+WpdtD2quN1QQBZT6HPtumQEhJE0UycEppUPs=;
 b=Aw2wZxtV4G7vBZ+7FPSYWcubHqgA9JFka4pNQuc2fUD+8dV8Wxd6gUf6y2HKk4s5fb3Cirhq06CaG8uGoHtIVLx2hY0+7cgw/bb8+ejFbAiaT+FhBgNW2sd9mWiCDNjTkfzLwvQKd/vba91BREKSWlwMrGBTb8mWWuXSGFrsmY2ufolo0SdMG2/WgA+RqvGxj8AR3+AB2KHx3b+huAOJRg9VV1vkyyDXH7zxPjebMZTKd1DdckAMiirGHBqZ4yPxz3N9Z0v56Z2D16gmDiDg39gvaiLWCAGOTFDqxSMhPj4ErtNEJhsrF0XqWZl2AT7qwLYf4a3tWhTmW8uph4YGag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WA2B6+WpdtD2quN1QQBZT6HPtumQEhJE0UycEppUPs=;
 b=FddCXo7xj+S3zrQyLZpvIqbc8WHty57Q/AkNKroYxm/FF4rO/xoYN9c8FhahUDmuAb55nTSsDZpTi7oxJOlBJLX7OnO8tkvTHkLXkBGy19eslrw3WfEX+x8W0GXEgvaq9r8yHgf6dJibV5AEuP4Qe0z2PII/+vikDUlqfibm3OE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by SJ2PR04MB8510.namprd04.prod.outlook.com (2603:10b6:a03:4fb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 21:53:34 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11%7]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 21:53:34 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [oe-core][RFC PATCH v2 5/6] packagefeed.bbclass: Add new bbclass for building feeds.
Date: Mon, 31 Jul 2023 16:43:02 -0500
Message-ID: <20230731215310.3949441-6-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731215310.3949441-1-charlie.johnston@ni.com>
References: <20230731215310.3949441-1-charlie.johnston@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SA9PR10CA0004.namprd10.prod.outlook.com
 (2603:10b6:806:a7::9) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|SJ2PR04MB8510:EE_
X-MS-Office365-Filtering-Correlation-Id: cbf016ac-d7bc-4174-9a19-08db9210961e
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ri8Bylt44BZGu6KZ+IFKNCOsROjBg3BqR5/RRoMfMCsoQF/sWLE05ysYCf5X3viNpiwV8xPLPmQ3LCU6RohNT+nuHzodTnpL0sghzwLc9I2rl+lalhSMgJxGw0XGgfBhmosSysvsYlBgrBcVrD/4yFhGooRsUcJMNHUS5zlHIqTDIWZNWZT9eLPSQfww1EQgm+9oV7UrdQiLV3NJ9PhktwvE1dyS9ZEdd4HWYV/VP9TPfY7Jx33HKAmZClVyb+NSN9oIv5VwOVnzT3R4uvaN/TBYaM2ESVr3CrvH/iiXFRMeRm+/7vBlhaWG9EMytM/AQHpmficpW4ysZAd3BGC5Wq207tfzh88W5YAm7pGH6QvgMmxIt1lTPKG9C6MV6u3mSuubzpPKA6nT7I0ZCvlbK4BRUocZjjWbYWI7cUk4z6FKnQgeYd9ht2nmtX+4uaXEm+bWKv/hgTk+4rldzHxvjuBqWniaRrEFaxQCZAM9LR4hsZjDgvBrIpB/CnKP6w4yRwL6SSkug+bjNQ3nmr5iODfRvQM89JgvSwRsbAQxAETZooSNue/b9IEDkDCVZ2By
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(136003)(376002)(396003)(346002)(451199021)(44832011)(6512007)(6486002)(36756003)(2616005)(26005)(1076003)(6506007)(186003)(66946007)(66556008)(41300700001)(38100700002)(66476007)(86362001)(316002)(4326008)(5660300002)(8936002)(6916009)(8676002)(2906002)(6666004)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OKRgCSFqgCbUBaHp2bSpl8t+z/goCBxIFLQNCtksG8TwcgXezVfmUv/XZmRb?=
 =?us-ascii?Q?BVyp3rq2Tvh2NFSmR366AuZIZDpJ9rvKg5t29sHTH4yv8pt5XO4B7c57z86n?=
 =?us-ascii?Q?4e6p8KsWsvdBnNF3UvyxIyJetiGgNAf35FaftAkxdTWJoUGJhBAfpWL/o1fT?=
 =?us-ascii?Q?hz2XdRKya0xwi/Uuz/9gpgauVpGmUPOAc0ptYyweNPDeUwAfVtgNIYruMF4e?=
 =?us-ascii?Q?0QTeYZYdzfU8+0zhDIkrr4FH2yOwXLNDhUxt+d3qXVkbKuWAbMh7sKiqx2cT?=
 =?us-ascii?Q?2+qiEnNPWMhiCjW2O32YAGld/LdKe4hkclckbRNTtB4pgsI4TiQOid/CfZx7?=
 =?us-ascii?Q?A9WrPGa/U43NX8IZ3ra0egunFlu6Q0o+EHl6LWEsKFzBSmypRKtBYvWMGtEu?=
 =?us-ascii?Q?ZJNo/v8FUM4sYFJYlJ2k94Fpy33v3pdtK4Xr0z9rrvt67BZ05KOXSjomGrdp?=
 =?us-ascii?Q?QJ/OBCyw8AzSmFHg/SUyxFD715MZNPZfuYRErp7BDQJMPbQNUVNdFc3HIM1K?=
 =?us-ascii?Q?QLlV04oxTioExKuMLxAhxAkJCjLdHLE+JbnTMBIRkibZYVvweUggocIE2Uda?=
 =?us-ascii?Q?VE3EbE/8gYVHfXyCQ3kl4bpVRGsllwj9oxxfbizu+6wFvJNSlOF+c8t5Ap9r?=
 =?us-ascii?Q?lQ3yb1lKnsL7PEde+rGXgVQd3Ul8Zzp2kJiZ9N3rvyq/N7VRllLmfbd9cEA3?=
 =?us-ascii?Q?dOOkwdYYW+lLZdPFrPREhO//twqzFK2Z1tWRPAKz7WigcoA0PlEv2+IdR32d?=
 =?us-ascii?Q?Ik8XyGEK0iIt4vdk7d0imaULK3eLP9FfEtTVH6J/AXfXUASRzcDTTsaudfMD?=
 =?us-ascii?Q?+NetyaUySGBzh2/iqqhTEqr13dLN9DTQ0c50Hh26V30uqMtriTAIwNJ73Q/c?=
 =?us-ascii?Q?3Jw9kkcDDLBHRiQlAKX9ufY+T1jXkc7JDc1326czSDO5zf8wZRyImQBjbIax?=
 =?us-ascii?Q?Dic2MjGs/5/e4/+0xWF3boE7fb3QOJ/b6w1YvONypOPErza7UWh09qLVnxec?=
 =?us-ascii?Q?iL4Va84emTwv6coDyT1gz+dgIrwVVl2JgrITgy/smvwNbXGbAaUISb6udu+c?=
 =?us-ascii?Q?N7QhuGzhKN95SairXWezQuag9DRAHx61ObPplhyRIMIy5luYVhztqAq10uRt?=
 =?us-ascii?Q?/YdpGvgy7ELdErhp6N7h3PHPK8UwxNxD3FrLAmwLji7z8lv8Ueo8aLldZyd4?=
 =?us-ascii?Q?BEIMTYXAL3B5EmMm/qfqOWybxcmdDR/RI41fiuQPAHDv5xHUXboBmTGxekt+?=
 =?us-ascii?Q?0DzI6mW9AiHrgbAZu0sNzNrdPX1Cs0XtyzLmg8qTAY+9t0vOZw7+KJt3pdMP?=
 =?us-ascii?Q?HGxJpNO7eA8KAtxX+eMGuB9omGio4uvkmHZ9M7eeAH8gn+CpCSaVDnnwYUm7?=
 =?us-ascii?Q?z5cw6k6QTTg3UqD34kezds7OO98XEDpELB2+SnTzMPyB8Pccqs1LsxzZlFEF?=
 =?us-ascii?Q?/bfPFdmjGggbM7Kz3maxbMdpUbNOMLSCIS7iIW/H5zIQLciwZGWrCsfdIVEe?=
 =?us-ascii?Q?uROXIKXD9hwo/6E6McDCaS6ajYjHCsQ5/9tSt6T9FR0tMqqTF2LmMkr/Rz03?=
 =?us-ascii?Q?PqFY4Hd/NCEvz0yhEDXSF6jSoJAdV9VybuHNrVkScoFBgR0Ef4F61PYwrGdv?=
 =?us-ascii?Q?ew=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf016ac-d7bc-4174-9a19-08db9210961e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 21:53:34.0647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t1eadp2hfaElkaXraIT4zvx0ktEawSeU5eHjcB9c+zamNGuk/l+OOpx0BiAh9UyTgQkK6Ngk5TUcd28vwnwCBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR04MB8510
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 21:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185179

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
 meta/classes-recipe/packagefeed.bbclass     | 27 +++++++++++++++++++++
 meta/classes-recipe/packagefeed_deb.bbclass |  8 ++++++
 meta/classes-recipe/packagefeed_ipk.bbclass |  8 ++++++
 meta/classes-recipe/packagefeed_rpm.bbclass |  8 ++++++
 4 files changed, 51 insertions(+)
 create mode 100644 meta/classes-recipe/packagefeed.bbclass
 create mode 100644 meta/classes-recipe/packagefeed_deb.bbclass
 create mode 100644 meta/classes-recipe/packagefeed_ipk.bbclass
 create mode 100644 meta/classes-recipe/packagefeed_rpm.bbclass

diff --git a/meta/classes-recipe/packagefeed.bbclass b/meta/classes-recipe/=
packagefeed.bbclass
new file mode 100644
index 0000000000..04b45e7723
--- /dev/null
+++ b/meta/classes-recipe/packagefeed.bbclass
@@ -0,0 +1,27 @@
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
+    pn =3D d.getVar("PN")
+    generate_feed_dirs(d, pn, d.getVar("FEED_DEPENDS"))
+    generate_index_files(d, pn)
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


