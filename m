Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 366E1C5DF70
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 09:12:00 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26394.1786957914267545080
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 02:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=foinf/Al;
 spf=pass (domain: est.tech, ip: 52.101.72.19, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ic4XspTAsTQsROniVJ/kcy6aIWEhY/AFDKRqo5oG9BqAj7DGP+NvyKRIUCPLnn6c0XR8ZrcmpM/SYRmrqLv+8t45l9gkYgie+djDaGuUIwKYaG3lzAwZsAFf9/DWvBzoR82ng3fqR8gf/mtfOb30zj6+GmOHMOcxD858+z4J3iij4mm1vqqCVnB5cBdlYx5fXYWIJZvhylYlbhJ+xSH4XCxTScp+wwZe+lhT+rW5J/TQqE0pQFtnBx5i8No49AwTULXBw1CMGNeowuuwrRsdtFRldBqgntKH8kLhLMdJzTAcl8Aq8d5HXv1x3rAwZM+9SnWv/bPwpMr0Dk7QC2stwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gYHWJJbElvRBp8gPgm5F3zt2JuOuZjaqQwAL/7hvkz0=;
 b=hmzvoS762Q0e+PvCjo23YqFpR9CeUdUhgIaKrbRwWMWeprUXfDek2iq7ojovh0bt93wP6/nCRnOVSZpsduuXN5JY+shmqB4upA82xbMy27Pwl7Ucb3MH3FRhGHE0Q3LOFAy7KZ+hX7lLm2qPe1w//LDKH4vCHBhsHFvZpVfKJYf4ZKzzvLBGZAlz18Bjt/b12eCjSzumPdCj+EYtIuPbNZtdcul/LRtnOlpQPLPzUeP2+u0STZPJ3W8TsOWzhrRhOuEdUHns/fzg2fq2hJu5G8mvaSp4nykLOAonHYGCj2x6vhImiqrsxk5hsyMxVf46RB0L0ANbS5ygzg6xQLzgNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYHWJJbElvRBp8gPgm5F3zt2JuOuZjaqQwAL/7hvkz0=;
 b=foinf/AluBESZWfvLp9OUfSCo7FJftlV2YaNI2uXFMb1/3RWjPBjrxIGrkznHlj3DoGzAj+5XYmt1Xe1GRwpIQ8uJDzxxU8jKxcgmn2/THB/TaZnlrgqCVuBcuteZjgAEzqnUu6/wHTMtBb0KJXixymZVRsgvNIlEsIIe7gmM1lDsPyaXtXr1W8lY4GRzQ1a+F1EJ6oGK72R1m8zBhu7lEWe2yNGbfn388fbt7Wp34JDSqTT6Y0q5BTK5UPMuGlWmskS8igVnJYY5WnzG93m5UJ+I/N6s5xOtib8ZjY85ci4H9SLotk6/+BJdrhwLSDy5eKGXJzg8lTlS1mJ9nQvOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by VI0P189MB3372.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2d0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Mon, 17 Aug
 2026 09:11:48 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.007; Mon, 17 Aug 2026
 09:11:48 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH] epiphany: upgrade 50.4 -> 50.6
Date: Mon, 17 Aug 2026 11:11:44 +0200
Message-ID: <20260817091144.45393-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO2P265CA0506.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::13) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|VI0P189MB3372:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d647fac-490a-4c47-cfe6-08defc3f90f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|56012099006|10067099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	KjlQ54Ui3HSHRJ5t7APE0geBkGecWMsTTkpJ0W+V2nuDsK3RyZnaCzIxqsfAeVDhLNbTdMG7wAoOjiPPqWZ4j1B42UA0/0O9r0TAotjcbhCj9TMF3R+vJbOFpV/ljSIspYUp4n1IGqok64jtEOED51pUTlFfX5oZZsKrwssHj/rTtGyoSK7Fvv0Yam2aV42id0cDNpDhxy9nfx27MxghsqKPo968P2t2X6YjUUSkK5uTWMnZdK3ZlRf0ki0jQVkOeCFSs3ICADh2wvqsfJ0FpIFOcYFiZzQdNhLv4+2Ng/HXxg1CI9BWtYeqmRFt7oRkfPTb0y2AYpW9o7UZo88MQrvEgwNb1mWzzDoXfcs9TRs5JJG9YnMaeiUsnFM+ZIyy67poSy+dHDbVgrtqVcn446OGk1uhv4txcnFGqhi/AcTdHeEv6SnddgTjCNMPDsY6Vci3MisqKw6PACH5KEQqXlrvwbdi1JmLq3JZEF5Z7bMnx/vTdPEs4XS4RJ4rL6Nq3ViQ8PLwmyip+05mgGgTO4feTL4BoMya8/dyLZXtwGCvq1OfIt9SAclAlFU0q+1KCqDoFNd1PwlzggmWqqnD6wsy16O7gc/xzQjI0qSJW8YF1zMcEfxEVvOa9Z8bB2vP+OwEsAJjJPAkh+JGit0Lq79DujyXQXu3UM6OnCXFG5g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(10067099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XcF0i1QLyeXqwjhwe4lNJR/rZlGRMJzU57t3xjKrWdPI/+DG+qfOa/aDvvUa?=
 =?us-ascii?Q?9DitYz+xyVlNFQvf98xEghS2aST/TGCJIT+l7jhRmnjR6uTrKROdgK9p910P?=
 =?us-ascii?Q?xClMpKrV6WLyfgvfN/W8lIQrvNvbZFhoS7MJ8JP9AyNuMfaxRY9YvwiQ+FFD?=
 =?us-ascii?Q?ThDf0baoA9sf9dXN2VZqwWklm6ul3IGVIivLD6z652uk3rcpFFbYkublWp8I?=
 =?us-ascii?Q?TpMysBg58H63DjuYAPyw8NF9QALk/SUNRoKoGNB0X7EmfP4H1FMks1McCrxW?=
 =?us-ascii?Q?wx01LpXO1JMS1rx3QvsCL4nJTN60dnWMNaqGZzXQ8R3KPe3invDCJ31bGOlC?=
 =?us-ascii?Q?hkbOkWtsW9srVETGWRmI09Rf+21LPr6KlqlXGjwrOyTO2Y9JizSPU5ZwnTxp?=
 =?us-ascii?Q?R4464JQvspN5l+BUobbY75G+BjiTd9+w+Qa7o/ENcuueevWEYsftrl2N324g?=
 =?us-ascii?Q?qOmI74heeHu4M+pYFGEGJudOCXPqnt8L9XO6i7TW0YaTUyOFVkErVho9MP7F?=
 =?us-ascii?Q?WPZ9s/MNhDKmRcta2/kE7d17Lw2nUrNfo7eihPOXknZJGctLYJai7/9V/IEt?=
 =?us-ascii?Q?Mk42F2zkNekvRCEtDlKcyuOHp7RwjDTRcn8+7t+wldYFDvoaDbL7QvovCkjk?=
 =?us-ascii?Q?4U+NGnsTgqFuvC+9tavZKe67jS6wgEbgKKbYp2csmroDYmhWDAmVBUtVqy1J?=
 =?us-ascii?Q?LCYNJq2jVNHykWF/aAti1y7v8jraVL8Ptsn1E13sx2Celp3nfz93AZ5FH8WZ?=
 =?us-ascii?Q?ub5lqn+tw4MsnHSoNNA666EVMD+T8FlUjLCrNMvjWnUw4d02y529LDMRZB7y?=
 =?us-ascii?Q?F8wEVYV9y+T2GbdPJIG3T6Lhv4VYrEdA4Pro+ICyKkKltfsVc4Na4kbsSp+X?=
 =?us-ascii?Q?Y6gVt+Tv//lT3zKheeyFGpq+9GWUbVcIUtBpO4kyFKyaNISWHiUf5069LEvx?=
 =?us-ascii?Q?WJWJPANQFJ9yfv0t/cVHvZyXRT6WcIHH4FJBnpYbTCiSy7vK+yeyTfv8sqRW?=
 =?us-ascii?Q?HiXm5885mhZ31DD6qMIn+mDs77pMUNlvRMUsjSZgS+SO9cFCw37EjUwfdiuc?=
 =?us-ascii?Q?JL3H9+Y4ujlQYbtESX9LdKnjxdadf7ihF0OeFzCU9yF7oPPTWGDT54O6s3q9?=
 =?us-ascii?Q?en/V5i098mnN9s9RoxWc3wkFwvhNa4DceKFj9hJ4kl7owYlkh+P3W2mgE57/?=
 =?us-ascii?Q?b1bERp9YuU8+gP2NqrJdxzp1qFlD5aSbNbQnaq9W8wEk3/vTJ5vMH0H8lkef?=
 =?us-ascii?Q?DExhjTVIx89IaE4tA7WGPu0EgAeg/FeryNI2iUY83961CJIk9jWsQZfFdb9/?=
 =?us-ascii?Q?OFE44ogkVyFnayXGONbe6tZ9BCb7tuh4lJY+f+zWyN2mZvOmXb1SJaXhnpDx?=
 =?us-ascii?Q?qI76DZEtb91l+MLnWymN9TUr1SglrvPKVKFARLh3vylBzLNRKMSDqAHmFPna?=
 =?us-ascii?Q?0ajsuYoqByx9zV1iyadRaPRvXNR672PNNgU/jqHiOxbP9Y9KBs/dQRxwX60A?=
 =?us-ascii?Q?BPii9bEBbsnH5J3e1wtfoKMVlMrW2gSAcWmoz1HthysgIJ2vNoJ9gId/xSgc?=
 =?us-ascii?Q?CsSissLBwDyy8B/ddvSoBK+u6SV9vUMEBoQbAVXbqpRdb7rjbpuCLqACu7Tk?=
 =?us-ascii?Q?CIigbxBrsaEZcM39FitbuzVHRzI4SUapcy8cJ89eChXOD98Nx7UblRD0zLYw?=
 =?us-ascii?Q?WEz0u6YEqME86bbMFfg2xXmClUSH9KSQpESQzQ/7rR01WZnHsS+dXZmpd+J9?=
 =?us-ascii?Q?0u4vVrQ0cw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d647fac-490a-4c47-cfe6-08defc3f90f1
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 09:11:47.9685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J5MdcwS4izUyjIw+XVQ0ZrEPvtoBMgCFt1lGUpbahI/T3BaR9doBG3riyiq4gVjtVXsZHsKilLl1MONSSo7R8iFpVxGeTaWTxeap35ZeJUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3372
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 09:12:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243601

Source: NEWS

50.6 - August 13, 2026
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Bugs fixed:
  - #2898 Invalid bookmark import crashes browser
  - #2921 Autofill JS Code Injection via CSS Selector
  - #2922 WebExtension XPI Path Traversal ZIPSLIP

50.5 - August 10, 2026
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Bugs fixed:
  - #2712 Crash when opening preferences dialog after deleting default sear=
ch
    engine
  - #2868 Addressbar URL prettification does not understand IPv6 addresses
  - #2875 Editing password username creates duplicate entries
  - #2901 Memory leak in the core string utility function ephy_string_short=
en()
  - !2091 password-manager: fix crash when deleting password record
  - !2094 Quote command line input before passing to shell
  - !2098 password-manager: avoid duplicate record when changing username
  - !2099 Fix crash when opening preferences dialog after deleting a search
    engine
  - !2104 Fix crash after adding a new OpenSearch engine

* Translation updates:
  - Belarusian (Vasil Pupkin)
  - Bulgarian (twlvnn kraftwerk)
  - German (Christian Kirbach)
  - Indonesian (Andika Triwidada)
  - Lao (Saikeo Kavhanxay)
  - Norwegian Bokm=C3=A5l (Kjartan Maraas)
  - Persian (Danial Behzadi)
  - Polish (Victoria Niedzielska)
  - Slovak (Jose Riha)
  - Thai (Aefgh Threenine)

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../epiphany/{epiphany_50.4.bb =3D> epiphany_50.6.bb}           | 2 +-
 .../files/0002-help-meson.build-disable-the-use-of-yelp.patch | 2 +-
 meta/recipes-gnome/epiphany/files/distributor.patch           | 4 ++--
 meta/recipes-gnome/epiphany/files/migrator.patch              | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_50.4.bb =3D> epiphany_50.6.bb=
} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_50.4.bb b/meta/recipes-gn=
ome/epiphany/epiphany_50.6.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_50.4.bb
rename to meta/recipes-gnome/epiphany/epiphany_50.6.bb
index 2b2d08b615..ad0fad1a65 100644
--- a/meta/recipes-gnome/epiphany/epiphany_50.4.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_50.6.bb
@@ -31,7 +31,7 @@ SRC_URI +=3D "\
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] =3D "1e26f9901f0f08bfe943aa70163c953334c7ec3d4a=
efc8d354e8a9c140b334a7"
+SRC_URI[archive.sha256sum] =3D "458222a8694cfc914e7a2d6de9879067001a8d65e0=
0a907d96112059c67ad446"
=20
 export GI_TYPELIB_PATH =3D "${STAGING_LIBDIR}/girepository-1.0/"
=20
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disabl=
e-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson=
.build-disable-the-use-of-yelp.patch
index 3506113945..12e9d98233 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-u=
se-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-u=
se-of-yelp.patch
@@ -1,4 +1,4 @@
-From 00469cfc5818c776aa02546e9e5643a5cf903e8b Mon Sep 17 00:00:00 2001
+From 9e51ca47efc74fedb420e6b66436569d56623e2d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/rec=
ipes-gnome/epiphany/files/distributor.patch
index 4d3e13bb31..b16552bfc6 100644
--- a/meta/recipes-gnome/epiphany/files/distributor.patch
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -1,4 +1,4 @@
-From d3a99151068c9abc231cf562b2875bec83ddd1eb Mon Sep 17 00:00:00 2001
+From cc0b9a6904297387068274c802784eea740782a1 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 26 Feb 2021 10:17:52 +0000
 Subject: [PATCH] Don't encode the distro from /etc/os-release into the
@@ -11,7 +11,7 @@ RP 2021/2/26
  1 file changed, 1 insertion(+)
=20
 diff --git a/meson.build b/meson.build
-index c7dedcb..9518ced 100644
+index c02b591..8af9fe7 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -15,6 +15,7 @@ if r.returncode() =3D=3D 0
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipe=
s-gnome/epiphany/files/migrator.patch
index 0aeefc6f2b..b20cc3058b 100644
--- a/meta/recipes-gnome/epiphany/files/migrator.patch
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -1,4 +1,4 @@
-From 435d89fd265c334fc4b64a315d6d2732853c4463 Mon Sep 17 00:00:00 2001
+From 12ead2afbdab96eeb6bac820c39c1e951a047c8b Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 25 Feb 2021 14:52:32 +0000
 Subject: [PATCH] epiphany: Fix reproducibility issue

