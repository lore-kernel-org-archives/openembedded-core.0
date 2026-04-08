Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56419105D99B
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 03:21:00 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.98302.1775618449880922412
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 20:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=pls/akL5;
 spf=pass (domain: axis.com, ip: 40.107.130.59, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RO0vqRsY89bDxKq6zpgv5qN0umXDBPWnQvOyscWxKyD7dv1RK5skjSZbZ7azEyH45UJI0j/83HQ9PmzTFmMpXWkqo/jlqaR4E79kctdXt35BesrS36FcdJ99cP2O/cvzfUU3PemhOPkvhrSEEfLbKw7dJdMgWaTKQb/7TFjcQeq83H4zT72Ch/C75UnpGZIJkI2hQxO+mu62X4JKXjJ3NUoRYtLjcN3s4iCx6MgaBBuC8qtVOnQRq0b6PK1rc4eO4odN0p+u9suXlM2qcc85ZC/A+iOg4EcnE9u2TC4dNoCghW8A7PuvuxpaNkMLGjSdQ7HkIEyl+KqqamL6FR81ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pEHqhqaicQxRyGfiPG0a3hCQoxbfgBLnqpdueXwNgow=;
 b=UIFC/Rj5QqDt5xaSkpLzanr22iHliILLKM3P0uV3l5cHQRYtI6vqgvonsslb1C37afYf2BJWEo9pGESyKA9UPDfhzXwAsNPJmeZmAEiRyVMZKu45v03NBb/pSslMbNJPyBPXB5EUgkicRTTfQ6F60nH6fLFlAl6zAuTTlksQizMrG5x1Xc/VwonS00WCSX2dOL1R3f3+wGFxhZd/vhV0lEVWfFvqRhgK9kdZtRgM9M3s+dZjsrFUHCEDQ0lkh/vW7EV7NVjc/1BzfwLJMZqhXU1b7ht0Zuxs2BqjzBW1BAT4rfr/9mkP/lhKQwiLzNnnLQWj6e8vUfNlw2itMjGTcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pEHqhqaicQxRyGfiPG0a3hCQoxbfgBLnqpdueXwNgow=;
 b=pls/akL5mw3erHXt0fFajqvQlCLw2hMkDRXYZ5tOh4ZjndDJ2aNVQ6m4IlHxZu31fylvOHVpc9YApHoow+545AWyFRwwz6XKlDb1HiWAjLdAfHIvBLempRO06RHOCgjaK6g6mST2OK+tJA/9GUS+m64EKnDAtbfTTbcvSGj37Z4=
Received: from DU2PR04CA0084.eurprd04.prod.outlook.com (2603:10a6:10:232::29)
 by PA4PR02MB8098.eurprd02.prod.outlook.com (2603:10a6:102:26b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 03:20:45 +0000
Received: from DB3PEPF0000885B.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::76) by DU2PR04CA0084.outlook.office365.com
 (2603:10a6:10:232::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Wed,
 8 Apr 2026 03:20:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB3PEPF0000885B.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 03:20:45 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Wed, 8 Apr
 2026 05:20:43 +0200
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Wed, 8 Apr
 2026 05:20:43 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 8 Apr 2026 05:20:43 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 7A7962E74
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Apr 2026 05:20:43 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 78757120319; Wed,  8 Apr 2026 05:20:43 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 10/10] gstreamer1.0: upgrade 1.26.9 -> 1.28.0
Date: Wed, 8 Apr 2026 05:20:23 +0200
Message-ID: <20260408032023.1810147-10-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408032023.1810147-1-pkj@axis.com>
References: <20260408032023.1810147-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885B:EE_|PA4PR02MB8098:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dcc6d3d-a4ac-456c-293f-08de951dd2c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|18002099003|22082099003|56012099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	RBu3juK6a5QIzsWKYYss91ivIEe0Gl/guQA8BNoFybamuBDIklMAFgd1ftycwvfTr6cV+toO/6GZSCc5MPIhmFiZejziw64EsTgvW8vWvQuF8Rov9kZg7fMJn4hy4wxXg7ipHxJkVUKtGsjMHxeYxDoZ8T7IEHt/CXZuib/voZhZM0hbVAhpbMs39NJaCsOZ7IY4v+ykSQoJ+hfWfB9KdcgmJp8BI3E4O51+odKyXY5EBTwjQHlHCEERAqlUvq2Tf8esZ+Kg4N80weOGCEJT2/LJYJd55Wp5PJtsEo3OU5CttzheABPh4Af5sUEwWssXPojVezHkHAefPzWTdK7Lk7JUVTyVnJti0AQPhK4mvERNP1oGhXz+pr7BcMH5014Xvxb1PcQ78itNh+jHjJOESPmBgO7b7ggPOANAi8fzLHJUpn2ulhtanbBiqWXrf74peTvAeIZVTKuSM4TaH9Uz2MPTuAP6HfPYPOgms/msJX3UvEA0+WEEGtUe+wlGUvUXSOfuIddoTb8MzU1P+9Vv8nLowj6TJpmi9VvwUfOvMyGrDHzmNl/fqt4pYJvA7Fex+elEOHlot4OXPWIZ/OXOxAp3ARQcBzvpAWn+Ugm8V4zhfolaaXMnEddBfLYNE6gsZJIso5Nd/hURBtdo++D/IRffVrRpidmFulbMY5vtG6ShloicI2SSACpid5lcImCKpPG0YnWV7cL2naM/8PcSDQ==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(18002099003)(22082099003)(56012099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	x4L83jpeX3cDkB4rDmXWtraoZA3cmyFkvvJTz8d+FEwERU5O1jG7pAhFhMrdzpt15MR2LsYeXmYJD2YvwntMNDnCmcGrwvYpUqiK81ReCbo9QrKZAPSKE93or2uDU54uT2VN+YZeww+eN6nkNRapd9/3slF2CpveiDRiOWm6xRamlqw8YQVEeO7NgoFgAETIPBB/aveqoB9y/43L3sEUViuN7Wf4jt6LSCenBc2CG7nbQv72DnVXuVyONKOMl8OQ1JZz/rOMcBnlVtjt5ya8YYZNTjrmAHKIGEWCHnbnjdq985DQJ1USQ3gjSEgOiajVIeH9+7parcFB6jAOY3BZqD4iLNhqbpbGTGEq5yx9pniBGheVofXWneC2wPTrwBBGTrn+iyCIuJcrQM5Qz/Hwzn3O70N3R7F6yC+G1+Bm2d7qk79pj1cD7YPvTb7epP/F
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 03:20:45.5433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dcc6d3d-a4ac-456c-293f-08de951dd2c5
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB8098
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 03:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234800

From: Wang Mingyu <wangmy@fujitsu.com>

0002-tests-add-support-for-install-the-tests.patch
refreshed for 1.28.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: No changes.

 ...2-tests-add-support-for-install-the-tests.patch | 14 +++++++-------
 ...treamer1.0_1.26.9.bb =3D> gstreamer1.0_1.28.0.bb} |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.26.9.bb =3D> gstr=
eamer1.0_1.28.0.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-=
support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gst=
reamer1.0/0002-tests-add-support-for-install-the-tests.patch
index ccfc869813..720a6f0c97 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support=
-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support=
-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From c33063360791e178de138304e29ab2264582d917 Mon Sep 17 00:00:00 2001
+From 92e7d4090fa458bf02d3418cd01c960982821e92 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: add support for install the tests
@@ -12,17 +12,17 @@ Upstream-Status: Submitted [https://gitlab.freedesktop.=
org/gstreamer/gstreamer/-
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
 ---
  meson.build                  |  4 ++++
- meson_options.txt            |  1 +
+ meson.options                |  1 +
  tests/check/meson.build      | 22 +++++++++++++++++++++-
  tests/check/template.test.in |  3 +++
  4 files changed, 29 insertions(+), 1 deletion(-)
  create mode 100644 tests/check/template.test.in
=20
 diff --git a/meson.build b/meson.build
-index 0a77e90..cadfaeb 100644
+index 8adc055..b5c9e5b 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -664,6 +664,10 @@ if bashcomp_dep.found()
+@@ -667,6 +667,10 @@ if bashcomp_dep.found()
    endif
  endif
 =20
@@ -33,10 +33,10 @@ index 0a77e90..cadfaeb 100644
  plugins_install_dir =3D join_paths(get_option('libdir'), 'gstreamer-1.0')
 =20
  pkgconfig =3D import('pkgconfig')
-diff --git a/meson_options.txt b/meson_options.txt
+diff --git a/meson.options b/meson.options
 index 39255cf..78af552 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
+--- a/meson.options
++++ b/meson.options
 @@ -16,6 +16,7 @@ option('poisoning', type : 'boolean', value : false, des=
cription : 'Enable poiso
  option('memory-alignment', type: 'combo',
         choices : ['1', '2', '4', '8', '16', '32', '64', '128', '256', '51=
2', '1024', '2048', '4096', '8192', 'malloc', 'pagesize'],
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb b/met=
a/recipes-multimedia/gstreamer/gstreamer1.0_1.28.0.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.0.bb
index c66f614629..63633fea05 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.0.bb
@@ -22,7 +22,7 @@ SRC_URI =3D "https://gstreamer.freedesktop.org/src/gstrea=
mer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.=
patch \
            "
-SRC_URI[sha256sum] =3D "8ee8772e468102ebe86d414d8c4c7440dd91d9f3e9396952ff=
23aecde80670c8"
+SRC_URI[sha256sum] =3D "6c8676bc39a2b41084fd4b21d2c37985c69ac979c03ce59575=
db945a3a623afd"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '=
', d)} \
                    check \

