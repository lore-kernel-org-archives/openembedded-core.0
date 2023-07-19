Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4AA9C001DF
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 19:49:16 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.74])
 by mx.groups.io with SMTP id smtpd.web11.4925.1689796153848062268
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 12:49:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=edcusgWa;
 spf=pass (domain: welotec.com, ip: 40.107.104.74, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+1erZgkJiNGrVgw5gQrg46DVGgyn0bgN7G8eHpOitz2NjTiEOz/H/48I1lh0V1qmQUomUgqGe4syI9cvUIGnWNpIM052DmfERU0Q1X9cWg47abhBmFeME8nsCYWoVIHm6Hm2vXQU6d9a3X/MlDTAhjJ6FkBp8MhexYHxiNArRd9f4/X250iE7D8ORmgEJXlgGgorRwBgAgvns1IajWwD6B+0ioKLl00r7EXJsDiSHNGiiQiCSeVuk/gmoELLnCgloH77YhsO7Ukl6mgMogYZbZQHeOSN6Fb4zzGuUdsirOO6zxBotF/DcvBblxxu8OizKyANpeOaV0eAVQ9IRjLfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6/6gvtj9BvGS2v2yL15HFlItHKJcHUi0SFrHunSohQ=;
 b=hWntdIUFNaSIwhSglNx6PV4/XDk3OLUzWTx5DcUaxsIAwzC4Dy/e2FW9YRfHDJL5sgI+OZpQJZ9AQEtYaacxTIx+KGl/X1jTMM4H3CBfUc+IVwokFmLm6+8slnGWp5l3mjDEtCfxo7DyglGjWqXMURJqSk5RgXlOdU4Q21Ouw9EZOLkp76Q/Gq7qemChTL91vxLyVfRO8j+8VkGbxQfCqpTdd0Q6bRW/adR1iyMVomPNh7PokoWVV8bccCoVaL66SATuYGXR9+W5CIvlGEv/MygxFBGKh9jiZgOhZsiD1NEfX2XoobZ0U1Xf0zeoReS4FLLFrhuf2ct6PRTKp2GMzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6/6gvtj9BvGS2v2yL15HFlItHKJcHUi0SFrHunSohQ=;
 b=edcusgWaM0IwBMbfrDZSxHTv1iC7460+FkrknpkXwOk0MiXvRSUuKU8hvPkaAzAnilDtF5UzdH9EmaJqtrZDkr41h+RxRN1QNKxL+8VEASPyBiACObzU8RQ8M4cwahXybI2vu2YP7IwV1YUvkax84aoXY7pBO9TNq81m4uK5bpQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DB9PR04MB8393.eurprd04.prod.outlook.com (2603:10a6:10:25f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 19:49:10 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 19:49:09 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v6 6/6] opkg: set locale from system environment variables
Date: Wed, 19 Jul 2023 21:48:43 +0200
Message-ID: <20230719194843.330741-6-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719194843.330741-1-p.lobacz@welotec.com>
References: <20230719194843.330741-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::22) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|DB9PR04MB8393:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c16185e-66ec-43cf-d6b7-08db889137f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SB1OfDJzz3/LK0vaJOaPVVfkcw8H2AyIiOM3QT6XqFdOxtcm+sWITDmWMT7UF4SkarkTB2lMS9ASAkLjJK4mvrOh5GIb2BnNWlHc/dAQY1jhQeHOg9V6E5ZMh2flIpRn8KFaXyYCO9TNjqk97xErMn3xaEb9ykEotnLcKNiQ0WCCrj90+iNJoRGpb2doBMIyzE4/or7F0snoKEaaAELHotpMP6ZsumKiVyKxia9vKH7h821jdNqCXam8KeFNpahQo2JjGXZg+uGa9AMPYtjnGHw8o0QB/5pYeispC1gjz4ZooQF1CZzk79xLy1vgLJQI8tYRt/7OqjOmDxAGAgOmbWBCpZeC0kQZEK3xevWp/DfbT7F3y1nCf0YbMPUmxhiUQEnysPJBeikmfD7cACVl71sWWMAChvgdRQZ8ifj9BLAbEpUR5BVXpBjjHY5CoMy8sALd0Vfz58M8yOgZkfNcg3ybAm7evBumOkG6WqlcXKvQQ4GC7/BIC3IGX1/c0pGITl2GzPzjyAqH8dZEsUigEiOHO4+SZC+xpdinpvr0PR8ticWgXjEG4dHt57am8M4K6dn3OCta8rCpbv70HN6gGsa4Un2LW+4lM6RWtssjdws=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(136003)(376002)(346002)(39840400004)(451199021)(36756003)(86362001)(2906002)(52116002)(478600001)(38350700002)(38100700002)(2616005)(26005)(1076003)(66574015)(186003)(107886003)(6506007)(41300700001)(5660300002)(8936002)(8676002)(6666004)(6512007)(966005)(6486002)(66946007)(66556008)(66476007)(4326008)(83380400001)(6916009)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MoKeIWDif9OfR4sDdhyjEeGC9XLn+ha1JrqlmViLrAjRI+6eFvhFRxfl55Gg?=
 =?us-ascii?Q?zd7LpWyIeXXksBMIKnMVhaPViBxPZ6P9XJJ//NUtndMdmzl1dJwP8VxRm3X9?=
 =?us-ascii?Q?pfG2NZfdwHhdvWppGfJ5fCv9gxDNDtXKnjaaGDsIGClxm6E9dcd8KRE4XxKx?=
 =?us-ascii?Q?r1BDjkijqAmkloH1Ho/2S046rJWJ+OSMcLq7IK22p65tcUcDQ2qXY4yiq9fw?=
 =?us-ascii?Q?CuX0W9+yEKoOInsuE5AGWy6g2ye9IdISHih9rIC5HUg5snECv142HWUqIORy?=
 =?us-ascii?Q?Bla8ZpML773n251Rh+mM9JPoFlKPdK4C3zV2cGV+snwWZF62w0fGl0f38U0/?=
 =?us-ascii?Q?KBY+aqdPnGaDWyxaZHebYGAjAB2y4biKCTSRtn6T2p7vUqCe4ZgDpEVRIkGC?=
 =?us-ascii?Q?mSlZXgBHL41Z1OOxYddyXj5nfalP3/gOIykRv1qB1pPuu3dUlm9f283LWuj5?=
 =?us-ascii?Q?srBrqNd/1w9ke3g3AEUx6R6iIMMhG7YACdIh5ngQjjwF1jMTo1Q5fkCwb1a+?=
 =?us-ascii?Q?wvJRqfFu/vM13jUH9WWqfQVP7S7yarWmuig37G/fQqnC4kR1r18LHCqkvebx?=
 =?us-ascii?Q?wnQifD8uDLxZaZgAgo4DuFJB5mNtb9PKCKCGaJH1kq73sZqF9LVs9Dt6l3Xa?=
 =?us-ascii?Q?IshcTIkO5g5o9F266DIOwWi43pRwqVLtm+LZSYDtF6ngSb+h+keVDzGNVB16?=
 =?us-ascii?Q?NtMwbtJK0oVOgSM4cZvn1/4bY5dpIzQn99+IKP36Ue0NIViicccr0+JRhroo?=
 =?us-ascii?Q?TGWFe0FCu2dfBySGB4RT3VHsUc3QY+UmwernTT19Yyz8k4nDa1buptnlRBiu?=
 =?us-ascii?Q?1+dkqr4tTnYyr/93UhgLL4m6lnjhuB8n9QkIRmSOKuwgG0JKBioFuU04BsdU?=
 =?us-ascii?Q?m/WMNy0FV34QI24WFq7UREU2nvQKitLdU3bcCE21Ku4Ve7qNMQOWKO9kObQX?=
 =?us-ascii?Q?7+EfgyHhCL7Xl9eF3YS7FYJ1CwVMyS89dyod8Q11Gai8EU/dMzgVLSgDfBDL?=
 =?us-ascii?Q?6KUed6g6wYoNpf9EHfUDvL47e0KocIZcySQUtKJ3AksBOVycrcvn22tf/Pwm?=
 =?us-ascii?Q?cv8eCbSWthCX/FhZmPTxcZOv4bcBpTiqG5DPHxneEczAfBXC22OrL4Aeycbh?=
 =?us-ascii?Q?difp0WU2s7PGDUkcLbLU3owfQFos2/ZraAfyxbnutdgNtaaEM4IEebxxrK5c?=
 =?us-ascii?Q?hh/JgsecR+JygK9BzwxIlrpONyl7pULBz5OLzGcoYS9ggEuJfC3atSED0Pc3?=
 =?us-ascii?Q?VC/ZP7WL2ZOohexPhc5QyqpZZdgZoCkgBs1jeADPv3l/KJW2XfFxn0F+1az1?=
 =?us-ascii?Q?GfodRmkkYNqDNBnOJ++w6QaK3vFQuvVnEuGdzm4L0yxiuhx7Bb3RAzHWANZF?=
 =?us-ascii?Q?OJY6iP1u7QL5hXTJP6pE4ieK/CXOAQBE+m6J623ajSxwloj8WH/0p36F5zoz?=
 =?us-ascii?Q?DggASPIniYK5dwAOmI9M9C89//7s39/q7g4sdm62O//Ww6vuWRXam7EJMLLi?=
 =?us-ascii?Q?nOu0XEP1qaR94Qg/aBW2URlwoCv1KS78iPbipbTnPxANZAbr/ek6JgsmX1Lw?=
 =?us-ascii?Q?h2cjBQXDZGa57RMqRSYdw4vags7bsdwKWbWdjxjX?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c16185e-66ec-43cf-d6b7-08db889137f7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 19:49:09.7236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q4Mi2vwMINJhk4gVZ+qffbLC0z0De5xpm5vWzjaDO20p2M83dflJam65sxYvW7KlGVbxssIayz3nI/OWO1KqEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8393
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 19:49:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184599

A C program inherits its locale environment variables when it starts up.
This happens automatically. However, these variables do not automatically
control the locale used by the library functions, because ISO C says that
all programs start by default in the standard =E2=80=98C=E2=80=99 locale.

Fixes warnings:
Warning when reading ar archive header: Pathname can't be converted from UT=
F-8 to current locale. (errno=3D84)

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 ...le-from-system-environment-variables.patch | 48 +++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.6.1.bb      |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0003-opkg-set-locale-fr=
om-system-environment-variables.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0003-opkg-set-locale-from-syst=
em-environment-variables.patch b/meta/recipes-devtools/opkg/opkg/0003-opkg-=
set-locale-from-system-environment-variables.patch
new file mode 100644
index 0000000000..71240ec8fd
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0003-opkg-set-locale-from-system-envi=
ronment-variables.patch
@@ -0,0 +1,48 @@
+From 712895b1914bf63ee4d669863bfd106814329076 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Piotr=3D20=3DC5=3D81obacz?=3D <p.lobacz@welotec.com>
+Date: Wed, 19 Jul 2023 21:26:09 +0200
+Subject: [PATCH] opkg: set locale from system environment variables
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+A C program inherits its locale environment variables when it starts up.
+This happens automatically. However, these variables do not automatically
+control the locale used by the library functions, because ISO C says that
+all programs start by default in the standard =E2=80=98C=E2=80=99 locale.
+
+Fixes warnings:
+Warning when reading ar archive header: Pathname can't be converted from U=
TF-8 to current locale. (errno=3D84)
+
+Upstream-Status: Submitted [https://groups.google.com/g/opkg-devel/c/16kgZ=
fJ26mQ]
+
+[1] https://www.gnu.org/software/libc/manual/html_node/Setting-the-Locale.=
html
+
+Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
+---
+ src/opkg.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/opkg.c b/src/opkg.c
+index 544c58a..0c729ff 100644
+--- a/src/opkg.c
++++ b/src/opkg.c
+@@ -27,6 +27,7 @@
+ #include <stdio.h>
+ #include <getopt.h>
+ #include <stdlib.h>
++#include <locale.h>
+=20
+ #include "opkg_conf.h"
+ #include "opkg_cmd.h"
+@@ -408,6 +409,7 @@ int main(int argc, char *argv[])
+     if (opkg_conf_init())
+         goto err0;
+=20
++    setlocale(LC_ALL, "");
+     opkg_config->verbosity =3D NOTICE;
+=20
+     opts =3D args_parse(argc, argv);
+--=20
+2.34.1
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.6.1.bb b/meta/recipes-devtoo=
ls/opkg/opkg_0.6.1.bb
index 2cac4af644..c7b8709112 100644
--- a/meta/recipes-devtools/opkg/opkg_0.6.1.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.6.1.bb
@@ -16,6 +16,7 @@ SRC_URI =3D "http://downloads.yoctoproject.org/releases/$=
{BPN}/${BPN}-${PV}.tar.gz
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-ru=
n.patch \
            file://0002-opkg-key-remove-no-options-flag-from-gpg-calls.patc=
h \
+           file://0003-opkg-set-locale-from-system-environment-variables.p=
atch \
            file://0001-Define-alignof-using-_Alignof-when-using-C11-or-new=
e.patch \
            file://0002-Add-options-to-enable-support-for-acl-and-xattr.pat=
ch \
            file://run-ptest \
--=20
2.34.1


