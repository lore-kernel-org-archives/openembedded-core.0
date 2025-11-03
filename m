Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF76CCFA06
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 08:21:58 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.84])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16039.1762158108538159684
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 00:21:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=pExf3G07;
 spf=pass (domain: navimatix.de, ip: 52.101.84.84, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VNoxiiC+M1QJvhKqZfTrXgp8ITKwfrV6MFlDdRE0sjqwqwa6ONUw43hHCf1xLLN8Vi7siXTkizhy2mvi9y5YZvBH7KURFtGNvkKAWQaur90DbzSotAWtMTDYzvPra4UJzxFbkMvU4vwtYbyi3PA/Rbc0t0MNuZV6Wunxlp7qwvNKH3TR8696A8OaKtV1sfRJzJ4raqtiDEparDqzSvn998b3hAv0HlIwoJmeqUK4H0wvUwHvygELxEfBealDL4KEDOW1Iuh1lrZoMK/otKNnJ2KVPNtRrlW0o3tacbZXCWt2Xw0Fhfa3gwnodngePavsWavDZrzjZWLIPzCBjI4B4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OT3THsQte62oIk9LaiYrMJFzAM5F6OSJ5h1JSbSEEtM=;
 b=W1Ynmhu3Nc5mMys0oQV+LXnB/MLjFkAq6J36cGRT8GbEt0WibO5YHbO/sqIBs+xx6fQcnFbEtm9RCqH+ijPJU7GqqBtAER7EwlqnpkmkMNahMdvaUTwMi0N14TnwnmAVkTOhZd505OzNFgu6Y9jHrsQBr6Hz2udR7wLmZDj4Hhg9NUohRMLKUHPmuARPB5313hZBP6y7CDrIYNsP8ZScfSBN5NwL/LJM0GsqyjpgJZRjonjD/6fKzwm5THJjIJD8Mei1lWzSPQpQy6btk/3/b3ecigEMzukw4U9QY7MRB2w1xng+EuQ9iWVVaH6Lt4Hg4s4blU6AtgE+30B2q4N29w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OT3THsQte62oIk9LaiYrMJFzAM5F6OSJ5h1JSbSEEtM=;
 b=pExf3G07wgebzUpdEFhtrPGUOAGgoMNRvo5x/VgZLxGvUi5SNY62swL65Do+XuFrpOGfkUH40PAk95rss40KyoGbD8bYVSpFrkUyQCqG/frsD76VzPlAAwrO6HYag4eXnwO4fY8FU2iGkHxlLnqREXx/Cot9/DUDrUbQCLlFLsE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by DU0PR01MB9432.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:32f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 08:21:46 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 08:21:45 +0000
Date: Mon, 3 Nov 2025 09:21:44 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, ross.burton@arm.com, 
	alexandre.belloni@bootlin.com, richard.purdie@linuxfoundation.org, joerg.sommer@navimatix.de
CC: Ross Burton <ross.burton@arm.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	=?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [kirkstone][PATCH 03/19] gtk+3: fix reproducible builds
Message-ID: <e2fe7aba2bf75bc92ca68c30fae7347a956146e6.1762157680.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0229.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8c::19) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|DU0PR01MB9432:EE_
X-MS-Office365-Filtering-Correlation-Id: a4ceffd2-3c66-4da7-79d1-08de1ab206f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Qmh1sti1R4hX1hgE18IFtvnOTDM5OdoqkdCJXfwtS3WFIqKpcIPKKm+PRF+s?=
 =?us-ascii?Q?uI0UzN2HncoNMHVQTCjgPuH2UV28g2ep71y3zrcf9xl6Odh2j4EI4vzgBm/J?=
 =?us-ascii?Q?0xs85SDST7ftl6kLjlJLIot8TWDOuLtnTMhYJmE42nhOIe7G0WMhDbiXza1I?=
 =?us-ascii?Q?LA1YekUVIouWP35BSsih4jhUgth31hpoHgmJGp8IREJWbRnW+iawBzD9Dqkt?=
 =?us-ascii?Q?i8livtNsK37y1GfJG3+l+AaByGWfAtMJJOhUSrV7Lt/cuyqIMeH5CVfNOkHD?=
 =?us-ascii?Q?YrDCKlWjYcZfr/RgPUO8OHXgTEcMOXOEGyMet/XxlMQJdxFYcO+gXI/zTM/8?=
 =?us-ascii?Q?VIbL1iWeeY0QEPJ8+cLvGYEPfZhKGRoRg6sV9m2M9dK67B14Y/gZVKHoVcIg?=
 =?us-ascii?Q?MEe1CD4UMn80y8rmnC4WHJ+vp+R2HDhfRTyrG3x6TOGZr9b2pKTfLDOcOahw?=
 =?us-ascii?Q?r0GoZvU3nKhQs3vUN5c1LfMiW0zRVoU+UgBYhyfM4VZPBiEUx0B307v8r7vJ?=
 =?us-ascii?Q?sv2+8VP5Rlmhy5sZbEq+s983EkZ1MB8RNY5WVBATaRJ8JvJjNSvH3vhy160Q?=
 =?us-ascii?Q?IQ0be5s+Q1ouiHL7T8K8z8PFuMC3wsJzG2Qn5QylH8Upl5UUPVJMF2sraae1?=
 =?us-ascii?Q?fibdLIs7fQjba3+qFNYB8Y5qnxCn40PhvJ50A5apgKwvz94RryQVfttZbqqy?=
 =?us-ascii?Q?5+YSPNrA7sDACjxr9r03R5nj1QWrjAwiQ9xur0yr6KS/etwUge6yJn822fR4?=
 =?us-ascii?Q?UdURM+OXBpq9HfDKACKdSf+dpU/S3j6v9XKFjYYEjfKqv+ldXcnCNd+yI92y?=
 =?us-ascii?Q?/k1jLdlz9OaxgYskN4CqzVMRImUdhAa1xTrFkQjfPcntRXgptfAhIbkZWIUI?=
 =?us-ascii?Q?TUc4y0prrvUGxbAqG2GD9CsFc488AmNLBx892Mjewzqs31bRBUNuz7U130Wp?=
 =?us-ascii?Q?lUJCoBCAVKsYrpVALrUudQb4Ln6CR5Cup9IldhNTDmP3SR+xl6mEa5Q64ssy?=
 =?us-ascii?Q?R43JGfDB6kmm6U6yqUo9d6Ja6b9LGw1WbV4w6QmHVgGj5AuyfVvjxn4HUEet?=
 =?us-ascii?Q?guEQ9d4agm3vx7mC33XMVQsUcObsU7vzxI6UZpSxEY/C7YH0QrffHoxz5tGm?=
 =?us-ascii?Q?1mc0DMesqqe8HtEU6xxnuMES3EJDzoP/NXQskU7mAqHAWeZ5ErmxQw5BsyJK?=
 =?us-ascii?Q?17lyYNwQcjP+1slstCSHaPZ661zgNQRJ48KNVgy/3E7iaoCUQ0ygPIrXCJNn?=
 =?us-ascii?Q?2cSnyOn/ONAh6kNJaDwBVaL/RsDfDAeffFI13SY9eE2ra/Le9Q8Dot9PFi+b?=
 =?us-ascii?Q?DgHnCni0ebDSPzX1f2EfakKBXzQtczA2o7rDtTNFsnt41D3zH+6eiESpLhKd?=
 =?us-ascii?Q?mblpLpJvF1ks2GWv9xYJXQdEr2HZ38LDkVArtUftJr3zRIBGxQPdOt1lV18e?=
 =?us-ascii?Q?xmABnJnpQ3YA2HNecrS0ERcM1Vz1SB35?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IlatUnklkxxFwIihtIsj2JrulUrVLlt9tpBJuGDq8dxJT5L7oTSoiScjcLhL?=
 =?us-ascii?Q?bgclKRE+crbzxAITlevK9Yn968+KdLwmS8svNASSaoxQO2vCTVb5qcn1lOHn?=
 =?us-ascii?Q?MBDITTz6Fj6uu0Uf4Ey99TlXfQHhTVmbQMXqTQ4ENtDoNyVbssBsr25GQWtv?=
 =?us-ascii?Q?7VphEDiiFmnBPqZUJ5lDq44aTm0GvQEkt4ATS0ZOj4FfHoFMqLEk+jQb8VkZ?=
 =?us-ascii?Q?sO3IEXvgGh2AhvvYyTC0jrH5UEJZpvG+fjQguXMRKpriqqviigIfPA+W88za?=
 =?us-ascii?Q?vtlFqtNxYhP0PyxBhtB6A04J7yKAU5pMw3aNGs1fZoQeiyeV7wFACeyJ6Fca?=
 =?us-ascii?Q?z+t8uwy02PoPccAsmjbV1jwt18rtFWNSXdFVEps86a1/Vqy67al6+T9cWIUB?=
 =?us-ascii?Q?PMGWeAohdQgyeLRjN50Dp2FWevpUdlcsP0KnIvD//AFbyQZeVkx3NQmZlPRQ?=
 =?us-ascii?Q?h+8IOlxvKh4N6rt9LYwbyQOg3AIkEZsLvVWp+kDSt4CBnH2GD1gX6US8l55W?=
 =?us-ascii?Q?L5Fo4bpkOkkIu0Siecw9RAe5qJKYtcFNdrDaMXpsRqPp1aKwgohjNrG6WITV?=
 =?us-ascii?Q?4x7dHBhWF14rXhz4rgJwARFOOiq2T2XFpw8GtIFbUm4VDyvPK8ziERErHTii?=
 =?us-ascii?Q?wqZVVhajmXplJDCs8mG3KQLGzd/M4EEPgf09bLg6epRHFRGq12+E/JC7su0f?=
 =?us-ascii?Q?xzFI4HK6GdxKuPYmQM8akqHH4y7ThCTApCRgY1593ukXYK5M7C21jlNtHBIv?=
 =?us-ascii?Q?xnw0ptX29h0aa7sxUOpJJ9lcds5hDXZVZP5wqh7TQNyKPSMons8lhypcwe1R?=
 =?us-ascii?Q?oCMPOETrM91dyJTsasdYKrPcXB9BHBONucnndViFzXfpkt7fNmP9l06Avv1k?=
 =?us-ascii?Q?EU4blfY3z3QyXjrtMb0Tsy/y8UJQjut7xi5apmVlxcxPcZfFsxw/P8BRcYN7?=
 =?us-ascii?Q?JnMo7FFfdUXNtRFJm51iYiqNBIb53ErI8QxweFN7FiLT7aFIvz5+kZub4feI?=
 =?us-ascii?Q?A/PY5GZEBNeNRuTJ4k1N7KHNpZw03DdrgBT1Fh8YaXGK9ImHZzG7kz43NqRf?=
 =?us-ascii?Q?Qm8ZHP6InSHt6xpM65Qv778fH2MLt1nbC3ZttY891vXE/vVnhotdxAKqgAOJ?=
 =?us-ascii?Q?gIvk1hldK9CWq8He0eRlQXnuw9KGyIw2AJQPCEPJBzDwzjMEqMC2BSOzmK2U?=
 =?us-ascii?Q?BieQJ/AaWaXQN7jwmCs80ipNFC3OdBGGR/GJtiDKsB1TRZX/vM7eoVVvXXma?=
 =?us-ascii?Q?rM0vBtbItrCCS0l4JYSLdIRfxOfg0bZU/dUJshVFyZ3wkd67AEs6AqJfADpE?=
 =?us-ascii?Q?ZkFvkgfUJV59Nqf/zDyxV1WctpKan3IYGqCLn4TVmoLou+b0oTihUCvsOSeL?=
 =?us-ascii?Q?bXMTYdyQ9UO6Je8f2AYic9lo4+oI9Ww0X4WF2m7yDCfdxvMQDnvTMHFPZUW5?=
 =?us-ascii?Q?rfP+zOvBGYis9vNZRqQOjtEd+iMF3oQtlXO66l9sZ7W8gKj4x24DoKpnalPs?=
 =?us-ascii?Q?Pg+z/6xTDW4D8T7LjS1VIc4iMjrV3RVtx264AjXzp+p0bm6PpBWk5Hpaa+qg?=
 =?us-ascii?Q?jNjiHNjh0CcBwCYRQD+bOWkgAsAr5ak7FJoT7YbMN+eWmnS4ZDlaigMvNx9a?=
 =?us-ascii?Q?dw=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ceffd2-3c66-4da7-79d1-08de1ab206f0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 08:21:45.7574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/rjemz1fbX/EBVEB006pVoH16ye1yGe2cxh/PpBR4QytIx0YrIf+47MCJ4btTwMJeqmgP+Bip3c4Nma2esN/Xr8bVJMAh7GhjbPH1MDSBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR01MB9432
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 08:21:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225617

From: Ross Burton <ross.burton@arm.com>

We can't drop the missing meson.build file into the build tree via SRC_URI
as then the timestamp of that file becomes the timestamp of the build,
which results in repeated builds having different timestamps.

Instead patch the file into the build, which doesn't change the SDE
every build.

(From OE-Core rev: b525fab08cb4f6d7b9a71bf82378a8396a20aba8)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Cherry-pick-of: 1628054eca82f3441cc119a8f741d00360171e77
Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../gtk+/gtk+3/add-missing-meson.build.patch  | 38 +++++++++++++++++++
 meta/recipes-gnome/gtk+/gtk+3/meson.build     | 14 -------
 meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb      |  2 +-
 3 files changed, 39 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/add-missing-meson.build.p=
atch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/meson.build

diff --git a/meta/recipes-gnome/gtk+/gtk+3/add-missing-meson.build.patch b/=
meta/recipes-gnome/gtk+/gtk+3/add-missing-meson.build.patch
new file mode 100644
index 0000000000..ef971ccff4
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+3/add-missing-meson.build.patch
@@ -0,0 +1,38 @@
+From 8a00d0269d547799b598adda364ad6c6ee328e6b Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 20 Dec 2022 12:09:07 +0000
+Subject: [PATCH] Add missing meson.build
+
+This file was missing from the tarball, but will be in the .36 release.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+---
+ gdk/wayland/cursor/meson.build | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+ create mode 100644 gdk/wayland/cursor/meson.build
+
+diff --git a/gdk/wayland/cursor/meson.build b/gdk/wayland/cursor/meson.bui=
ld
+new file mode 100644
+index 0000000..94cf47a
+--- /dev/null
++++ b/gdk/wayland/cursor/meson.build
+@@ -0,0 +1,14 @@
++# This file is missing from the 3.24.35 tarball
++
++wayland_cursor_sources =3D files([
++  'wayland-cursor.c',
++  'xcursor.c',
++  'os-compatibility.c'
++])
++
++libwayland_cursor =3D static_library('wayland+cursor',
++  sources: wayland_cursor_sources,
++  include_directories: [ confinc, ],
++  dependencies: [ glib_dep, wlclientdep, ],
++  c_args: common_cflags,
++)
+--=20
+2.34.1
+
diff --git a/meta/recipes-gnome/gtk+/gtk+3/meson.build b/meta/recipes-gnome=
/gtk+/gtk+3/meson.build
deleted file mode 100644
index 94cf47a37f..0000000000
--- a/meta/recipes-gnome/gtk+/gtk+3/meson.build
+++ /dev/null
@@ -1,14 +0,0 @@
-# This file is missing from the 3.24.35 tarball
-
-wayland_cursor_sources =3D files([
-  'wayland-cursor.c',
-  'xcursor.c',
-  'os-compatibility.c'
-])
-
-libwayland_cursor =3D static_library('wayland+cursor',
-  sources: wayland_cursor_sources,
-  include_directories: [ confinc, ],
-  dependencies: [ glib_dep, wlclientdep, ],
-  c_args: common_cflags,
-)
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb b/meta/recipes-gnome/=
gtk+/gtk+3_3.24.35.bb
index dae0d029df..52e3a59ad6 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb
@@ -3,7 +3,7 @@ require gtk+3.inc
 MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
=20
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-$=
{PV}.tar.xz \
-           file://meson.build;subdir=3D${S}/gdk/wayland/cursor \
+           file://add-missing-meson.build.patch \
            file://buildpaths.patch \
            file://opengl.patch \
            file://CVE-2024-6655.patch \
--=20
2.51.0


