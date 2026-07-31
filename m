Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92334C5516D
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 10:37:23 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3654.1785494240082908936
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 03:37:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Tw8LopX+;
 spf=pass (domain: est.tech, ip: 52.101.65.54, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SvgN6ZOgswlEii9qjRwkI8Lj+FrMBDjvRNWH4vob8K39IlyJBmDJxtjpIZ3kdIGeOijloVDsHuPmDPSkI9PM6s1l0xCZoEz5bTfueAeuBghvfnDX6d9yDvZtecHnlXh0senc+sa639byoUIB2HY0tuHctf1tAsDGlRgUiwXCIXWX2nJWBqYMp+Ab95TChIY9ME1peaDLUrL1McRmc5NDGL+hJVFzcXK0o126uy4k/g6kY8EytuAMLFG2hyBJVEWbCYbv1nhfxU5e/hB9bL+Lz0mhbvm542W/uTaSqtRB8WFy5j7hOL6ZgJ+akHKeWrmqtjJu+JhKZ1uH6TUoWw9AZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rKGciNEnyE2FkMYbl+kMRG1QxhC804pT+/Rq8YoGBOc=;
 b=NL3Tw7hUqRyqeBz/2pwOHhDREKB8qjhHuoatKfrszL4nFtIhiPZp7prvGeqeqM79Yljnw4vcNzWTaVinawG5PoUzcUEY6KtYjumadj/VwATWKDaWbhDvJma8ok5LTow0stQ2z/1EkPHW5F8vNe26EMHFYtDrRm2cZ7lP9s3/pauLcbJkaSsXsCGXK/34J7NkBcXxLJmdqZ8EQvsK9sjM1ewATgJonKNospaecSlpACzmY/oChkp9CqxiuVVvJpXaCnjG4DR91DoXisz4qRHGBwCot0wx/5sQVC5q1R13OOS3qRwKVNSMHQmxjEfGFhcHzmhNQLH42kE0CDHwREdqtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKGciNEnyE2FkMYbl+kMRG1QxhC804pT+/Rq8YoGBOc=;
 b=Tw8LopX++o7HzBB8WajQ+Ncvn3jEfQDg8PL2lx6Nd1xUyk6gsSOURY7N+p6qyFSrtxEcfibCN+b36dVSOvgJvfamsPKZvkpfOR7N7MLgeWZyxd6nsqlBMJqEDE4BfTFPnUJcpFnVmvxIpb+DV2vdwf9lREBSLoN65o5EiF1Zt1PlLucne7jtbLnhhEZw3UmRCmt214Zfth2QLM5KqUOEg2mUg5bzQ+edNplro9eagOqLWtH1/xzN46wmXC4wIBYqBh0OmupeXx2D+1jikriN/p7fShDphcS6zAvmpScV9jlOcMCCrc4yDab67Dv7QBYCxQQpX+BfTmvcJU3+eiQpmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PA1P189MB3169.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4e4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.10; Fri, 31 Jul
 2026 10:37:14 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.009; Fri, 31 Jul 2026
 10:37:14 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v3] glib-2.0,glib-2.0-initial: upgrade 2.88.2 -> 2.88.3,2.88.2 -> 2.88.3
Date: Fri, 31 Jul 2026 12:35:22 +0200
Message-ID: <20260731103522.81637-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260730124721.33400-1-jaipaul.cheernam@est.tech>
References: <20260730124721.33400-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0222.eurprd04.prod.outlook.com
 (2603:10a6:10:2b1::17) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PA1P189MB3169:EE_
X-MS-Office365-Filtering-Correlation-Id: 697e7e46-c20e-4623-c384-08deeeefaf5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|13003099007|6133799003|11063799006|56012099006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	PC/TsXZ1MGVBW2TPkwb9Pgq4wfj+RlMcBXhOXFkgsMwHZcsD8wsU4AC/T7D3Wb3nuT4h+GzsHD8VX+jfZhgB9F7PSj8g+P1ECq6FZSjdzJRpAmL9WX7Abhj69fJ+c7nSA0ESF9RkU7oNr4XRyLV1ujY5N1jlZDs9TS6TGppmQnluE2cwlqkRMBWlrx6DdclikaltCEoruhs4LV/XZ3sz37aAmPUQWe8lsvKW8EumxtTr+jKFNwnguvJIxpE0SJj/YOYX3qbRNAntFiNjMAeuuL2PoUciBuKBOzakwZXkl/aQ2BkLAiMs5o2ZzQdJU86InylbujSloN7MLR/l6UGR0HG7UZwDkwPnph3sc2tZc72uc9rzGPz5H3jlayoZ6PPWCDi43hy2F0Y7AWSqcugfFchz/XIvAKYqp7pH4YygPIsODxuUpFQjPgAMqg25zQg3eCBSX9hPHIWDnN/RWtlrN7cukLjcnWr9nUN3eak2t2Fg/VEq1QvLjaYt0gZZJgP3xavRhqzVyqrrVbW6ttnm+FHJkWQoNLkOiyYTHkqzj7OzJxVeQjsUedbFdA393N/OxWr3r/bKjrdyxtDdi+E3+Tazn/vS7Nqn4vLTlADQlvka0dOufD9dImCfM3ov7Tqufbxn7RKiQ8XUZIT8pnYJiqEMlTpVIj/+IkY3N09B0zE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(13003099007)(6133799003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zy6Q5eAyL/WJnlijEgG6eoonYjjz+q1X8/wFX+nCM/sW9tWIuaVCfRnUt81x?=
 =?us-ascii?Q?y3uQ/7g3KthO/h6txbOIJ39hlIFlFLBmCqfVg3cRAeM5UhYeHNFwPU5+kfsv?=
 =?us-ascii?Q?nRwcW5a4aHkSybGWoYH5nbfbgqobLQuyNecl6QmkiADCujCj2y4jhdw50bNN?=
 =?us-ascii?Q?bxqlA8rLIAUtykiEEes9YgenDzgzPcOkashn9LSwDzyJu5rq+GkR1ZPxOs+B?=
 =?us-ascii?Q?LCqVPlNb6qV/E5F2z0MxwinaCAgnzhjpwfxH63Bo2t6s/2FeAJcw08E15l13?=
 =?us-ascii?Q?6Lm8YGA+wm63vwqnSKaVbz0EScOHH4K5s6AQoysoEsT4eKw0de9QTYetl+/4?=
 =?us-ascii?Q?uppcG4E+90KhurxO0VFJxr3fjo/MJiTXNCTXBXA3JOVhf0w60ErB5P/+tPp3?=
 =?us-ascii?Q?uk9dSOoVsBvj7kgLS6hTZVrVSkewcWnJ8WMaWn1RjPgl5qTWpDGaNu7WDHNz?=
 =?us-ascii?Q?27rwsJOkd7evZ4bK149vxqSQXfPAMroQhqtj7j8ji8EWu5eCsDQm8syAG5y1?=
 =?us-ascii?Q?aEaT3nXng/LN0SZPSQRR47upMAedxjL3C9xhFt5tQzyyLsf6ioBVhwFD49+N?=
 =?us-ascii?Q?fsg5P50+a7YqyXIKjfS57MXZHwCE9sBlXqCXApWVRDqIn75ENjPdMLw2ixVk?=
 =?us-ascii?Q?VUl5XojmkGwz6i/Zb97wPzPkt0BXHa2LSO5GAvilGDw4J+EnUSLcPuk7MGtN?=
 =?us-ascii?Q?9EfGIbHMLbH6L3gbADNDiI19B9tdFTvxM34RJc4yW/cisQTFHACD60yKDISs?=
 =?us-ascii?Q?gxF0By2av5bTKEGExeL5FI1d1P9SuCETdM3xNhWHjC8b5IvT3FTMod9Pwy6D?=
 =?us-ascii?Q?2W9GigOgvo/R1UA6poRrfUlNuC/Dz+OqiPT1SW6+0E10Su+1mnQ0dse+4av+?=
 =?us-ascii?Q?e67zPRWcUQX1Hvdt+2cfzcKHl41pjR2QvRZc/hEPl6q5ev8FGhwO3OoqNS+H?=
 =?us-ascii?Q?TJkLxkbcYkuhd0UjvHBHMwpvFzgBn69zAcweI2e8gLcTbrIG8Hg8J5xgpGE+?=
 =?us-ascii?Q?XVgwCRKhwk1hMGb1qo3zr8OtrOh4JlVVU4dTnOtd2z1nqFZGbufWM0XqJkN2?=
 =?us-ascii?Q?uQwK8KYDyM4H/3CR35JqKtam79qH+a4sRILk/Ponv/RVZfh+1/fvBiBnfWxN?=
 =?us-ascii?Q?2IBcBjNl1YrCcuU8xDYZrhA/ZJ040KnLasbIe3TZOAeNZKd/YT8HJCm+xWlB?=
 =?us-ascii?Q?gmwr9KqKnCBEBSPcvHKEjdTbQJL0CrCEhtylEICRET4pEobg30l8Dc/GRPP5?=
 =?us-ascii?Q?DtuGWRMmRxf8FzuiZzDmEUBF1mWpCGSF+EBhPnziL0QAxtCa5cyVpQ1lirim?=
 =?us-ascii?Q?HXN2bO97Na6YW4rZdsO71z1cCIxrQMuw5dwvkc/ujEbxA7nLqtVdF7P38DJ+?=
 =?us-ascii?Q?pUgA5ivjf1D35+Qmyey/azpBKZsDMaVGmK0qHwe8n+FKd70s5CctCrQ04O5N?=
 =?us-ascii?Q?rPPVhjZkW7S+nHT525KBKF4sfVJXHDul8DM3pfgtJjhmm/i+63rjC7EBlkHP?=
 =?us-ascii?Q?Hk148IkEF+TfNphTttSXA5+LCD/0SWkvoENTgiq2qb1wLPcAGTsDJ/GYnq/a?=
 =?us-ascii?Q?xIijgiYUBiXPvmvgzzb+aER2BBdkF10YFLqCgENwLxng3QCuDuG4dvbPKNoj?=
 =?us-ascii?Q?jKlRKktyNdLnrsBJSSIA40dUa8vStMY6WMxnhpx4lPnekGJjZa/RFdEgw+Wz?=
 =?us-ascii?Q?Ja9mnb9QKibYzN/OG6WX3uVNAwMX7OzY6kiev11id3rKvu2ylr0P6Z48f8bR?=
 =?us-ascii?Q?ph8SDKlX/KjMbdIEdJ6pzevH2f1XgHc=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 697e7e46-c20e-4623-c384-08deeeefaf5e
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 10:37:14.2428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BCmL04VsdMzYqPDmEFRNsIxSH5buYYX0eTr8/X+bWZrYjUjAeCOPsJ1aoxgq5VKOkoZMh+qz2sTKI3tVjndJAIp+totvIoYNxWIpgGRKQ8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3169
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 10:37:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242422

Changelog: https://gitlab.gnome.org/GNOME/glib/-/blob/2.88.3/NEWS#L1-L17

Source: NEWS

Overview of changes in GLib 2.88.3, 2026-07-29
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Fix potential miscompilation with GCC 17 with G_GNUC_CONST on get_type()
  functions (#3984, work by Sam James)

* Bugs fixed:
  - #3984 G_GNUC_CONST vs get_type comes home to roost (Sam James)
  - #3985 (CVE-2026-15588) Security report: GDBusServer pre-authentication =
DoS
    via unbounded SASL line buffering (Philip Withnall)
  - !5225 Backport !5223 "Drop G_GNUC_CONST for *_get_type" to glib-2-88
  - !5241 Backport !5240 "gdbusauth: Limit length of lines read from client=
" to
    glib-2-88
  - !5242 Backport !5238 "gpoll: Correctly zero-out heap-allocated fd_sets =
on
    macOS" to glib-2-88
  - !5243 gdbusauth: Unmark a new string as translatable
  - !5259 Backport !5248, !5249: several Meson/gcc fixes to glib-2-88

CVE-2026-58016 patches refreshed due to context changes in the new
version. The patch content is unchanged, only line offsets updated.

Fix buildpaths QA error from upstream !5259: use the .in template
as input for the installed service file. Submitted upstream:
[https://gitlab.gnome.org/GNOME/glib/-/merge_requests/5261]

ptest results (qemux86-64):
                    2.88.2      2.88.3      diff
  Test binaries:       308         308          0
  Sub-tests:          6207        6207          0
  Passed:              306         306          0
  Failed:                1           1          0
  Skipped:               1           1          0

Pre-existing failure: glib/gdbus-server-auth.test (SIGABRT, same in both ve=
rsions)

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes since v2:
- Dropped unnecessary output rename in buildpaths fix patch, kept only
  the input change per upstream review

Changes since v1:
- Added patch to fix buildpaths QA error, submitted upstream as MR

 ...t-write-bindir-into-pkg-config-files.patch |  4 +-
 ...0001-Fix-DATADIRNAME-on-uclibc-Linux.patch |  2 +-
 ...-gio-querymodules-as-libexec_PROGRAM.patch | 12 +++---
 ...ng-about-deprecated-paths-in-schemas.patch |  2 +-
 ...ces.c-comment-out-a-build-host-only-.patch |  2 +-
 ...es-Fix-installed-service-file-using-.patch | 34 ++++++++++++++++
 ...on-Run-atomics-test-on-clang-as-well.patch |  4 +-
 ...ot-enable-pidfd-features-on-native-g.patch |  4 +-
 ...dcode-python-path-into-various-tools.patch |  2 +-
 .../glib-2.0/files/CVE-2026-58016-1.patch     | 26 ++++++------
 .../glib-2.0/files/CVE-2026-58016-2.patch     | 40 +++++++++----------
 .../glib-2.0/files/relocate-modules.patch     |  2 +-
 .../glib-2.0/files/skip-timeout.patch         |  2 +-
 ...l_2.88.2.bb =3D> glib-2.0-initial_2.88.3.bb} |  0
 ...{glib-2.0_2.88.2.bb =3D> glib-2.0_2.88.3.bb} |  0
 meta/recipes-core/glib-2.0/glib.inc           |  3 +-
 16 files changed, 85 insertions(+), 54 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/files/0001-gio-tests-service=
s-Fix-installed-service-file-using-.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.88.2.bb =3D> glib-2.=
0-initial_2.88.3.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.88.2.bb =3D> glib-2.0_2.88.3=
.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into=
-pkg-config-files.patch b/meta/recipes-core/glib-2.0/files/0001-Do-not-writ=
e-bindir-into-pkg-config-files.patch
index 11e9508840..c22ef9fdb3 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-co=
nfig-files.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-co=
nfig-files.patch
@@ -1,4 +1,4 @@
-From 83282a978c5107c682ab4c75ac7407961bb17788 Mon Sep 17 00:00:00 2001
+From 94f8f5bf51db5219022f6a646e784cb67d284282 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not prefix executables with $bindir in pkg-config file=
s
@@ -15,7 +15,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 13 insertions(+), 11 deletions(-)
=20
 diff --git a/gio/meson.build b/gio/meson.build
-index c7da257..8a00989 100644
+index f9aa0c8..48ff2a5 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
 @@ -934,17 +934,18 @@ libgio_dep =3D declare_dependency(link_with : libgio=
,
diff --git a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclib=
c-Linux.patch b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uc=
libc-Linux.patch
index 40398f25f7..bd7a04cccf 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux=
.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux=
.patch
@@ -1,4 +1,4 @@
-From d02e061f830b7051878e8a467f393e85110e4e1a Mon Sep 17 00:00:00 2001
+From c80659ca01051f8e83dccd4eda15a811b0ea377d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules=
-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-Install-g=
io-querymodules-as-libexec_PROGRAM.patch
index bf669bd4b7..8f6fd98472 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-lib=
exec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-lib=
exec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From 72a58d19ae7f80985d9c91751fd6c359464ce292 Mon Sep 17 00:00:00 2001
+From 25d6cb83b6b46181fbdad1a6f872a3788d6e4843 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
@@ -9,15 +9,15 @@ renamer does not cope with library packages with files in=
 ${bindir}
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Upstream-Status: Inappropriate [OE specific]
 ---
- gio/meson.build | 1 +
- 1 file changed, 1 insertion(+)
+ gio/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/gio/meson.build b/gio/meson.build
-index a3e6f18..c7da257 100644
+index a3e6f18..f9aa0c8 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -1067,7 +1066,7 @@ executable('gresource', 'gresource-tool.c',
-
+@@ -1066,7 +1066,7 @@ executable('gresource', 'gresource-tool.c',
+=20
  gio_querymodules =3D executable('gio-querymodules', 'gio-querymodules.c',=
 'giomodule-priv.c',
    install : true,
 -  install_dir : multiarch_bindir,
diff --git a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about=
-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/files/0001-=
Remove-the-warning-about-deprecated-paths-in-schemas.patch
index eef7c9db86..d64576b11e 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprec=
ated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprec=
ated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From c1eaa4dd2e2c09e9930949d4a9ee08e3e21b1a88 Mon Sep 17 00:00:00 2001
+From 29be4e2681b78d7856143056f769040be076b03d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-co=
mment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/files/0001-=
gio-tests-resources.c-comment-out-a-build-host-only-.patch
index 14c8c701ba..579999fd6d 100644
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-o=
ut-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-o=
ut-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From d9c75aef8b68887ef4f1dd9bb73542cc0ff02b20 Mon Sep 17 00:00:00 2001
+From 12bf3fded3b4c0c7b2d7ae7810d6eef47ed747e5 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-services-Fix-i=
nstalled-service-file-using-.patch b/meta/recipes-core/glib-2.0/files/0001-=
gio-tests-services-Fix-installed-service-file-using-.patch
new file mode 100644
index 0000000000..f88aedeb39
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-services-Fix-installe=
d-service-file-using-.patch
@@ -0,0 +1,34 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Wed, 30 Jul 2026 06:26:00 +0000
+Subject: [PATCH] gio/tests/services: Fix installed service file using buil=
d
+ path
+
+The installed version of the service file was incorrectly using the
+already-substituted build output as input for configure_file(). Since
+@installed_tests_dir@ had already been replaced with the build directory
+path in the first configure_file() call, the second call just copied the
+build path as-is into the installed version.
+
+Fix this by using the original .in template as input for the installed
+version.
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib/-/merge_re=
quests/5261]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ gio/tests/services/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gio/tests/services/meson.build b/gio/tests/services/meson.bui=
ld
+index 1111111..2222222 100644
+--- a/gio/tests/services/meson.build
++++ b/gio/tests/services/meson.build
+@@ -18,7 +18,7 @@ foreach service_file_name : dbus_service_files
+     # Build a second copy of the service file for the installed
+     # version of the tests.
+     installed_service_file =3D configure_file(
+-      input: service_file,
++      input: service_file_name + '.in',
+       output: service_file_name + '.to-install',
+       configuration: installed_cdata,
+     )
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-o=
n-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run-ato=
mics-test-on-clang-as-well.patch
index 1fe00df8fc..3f9b9e4741 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang=
-as-well.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang=
-as-well.patch
@@ -1,4 +1,4 @@
-From f72296cbd6f04f4f74b49b961f3cb405efa112f0 Mon Sep 17 00:00:00 2001
+From 0530e624dd47ee18aab18c8d403da12bb297f26e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/meson.build b/meson.build
-index 25802aa..c53d216 100644
+index 22ed181..87497b7 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -2100,7 +2100,7 @@ atomicdefine =3D '''
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enabl=
e-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/files/0001-=
meson.build-do-not-enable-pidfd-features-on-native-g.patch
index fa46bee904..0912859698 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd=
-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd=
-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From 03614474ac998422d0348c16c588a9ad50c97398 Mon Sep 17 00:00:00 2001
+From 0147fb147548e0657f298ab8e050ef8aaad3c850 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native glib
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 1 deletion(-)
=20
 diff --git a/meson.build b/meson.build
-index c53d216..330ccf3 100644
+index 87497b7..6955b02 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -1098,7 +1098,8 @@ if cc.links('''#include <sys/syscall.h>
diff --git a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-p=
ath-into-various-tools.patch b/meta/recipes-core/glib-2.0/files/0010-Do-not=
-hardcode-python-path-into-various-tools.patch
index 7a2c168756..c032d575eb 100644
--- a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-int=
o-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-int=
o-various-tools.patch
@@ -1,4 +1,4 @@
-From f37cec951e3c564d96afcfee1279f4a9fafcc822 Mon Sep 17 00:00:00 2001
+From 2bafa636db0241952b9168c62f051900ebf8b058 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch b/meta=
/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
index 2c4b248b97..f6883ba85c 100644
--- a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
+++ b/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
@@ -1,8 +1,8 @@
-From 38eee3870fbcf6bdf8e6b1281bc7a98d32b68521 Mon Sep 17 00:00:00 2001
+From 9a59b64b294843842efc86148485c8b3530cdfd1 Mon Sep 17 00:00:00 2001
 From: Philip Withnall <pwithnall@gnome.org>
 Date: Thu, 16 Apr 2026 15:27:37 +0100
-Subject: [PATCH 1/2] gdbusintrospection: Fix XML parser state handling for
- <node> element nesting
+Subject: [PATCH] gdbusintrospection: Fix XML parser state handling for <no=
de>
+ element nesting
=20
 The check for whether a `<node>` element in D-Bus introspection XML was
 nested correctly was broken. `<node>` elements can only be at the top
@@ -27,10 +27,10 @@ Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.c=
om>
  2 files changed, 34 insertions(+), 1 deletion(-)
=20
 diff --git a/gio/gdbusintrospection.c b/gio/gdbusintrospection.c
-index c7be334ce2f7..6f722ee6153d 100644
+index df5daa3..78a63e2 100644
 --- a/gio/gdbusintrospection.c
 +++ b/gio/gdbusintrospection.c
-@@ -1272,7 +1272,7 @@ parser_start_element (GMarkupParseContext  *context,
+@@ -1258,7 +1258,7 @@ parser_start_element (GMarkupParseContext  *context,
    /* --------------------------------------------------------------------=
-------------------------------- */
    if (strcmp (element_name, "node") =3D=3D 0)
      {
@@ -40,13 +40,13 @@ index c7be334ce2f7..6f722ee6153d 100644
            g_set_error_literal (error,
                                 G_MARKUP_ERROR,
 diff --git a/gio/tests/gdbus-introspection.c b/gio/tests/gdbus-introspecti=
on.c
-index 44cb7a96af45..daca313f77e7 100644
+index cb99c94..05710d4 100644
 --- a/gio/tests/gdbus-introspection.c
 +++ b/gio/tests/gdbus-introspection.c
-@@ -299,6 +299,38 @@ test_extra_data (void)
+@@ -300,6 +300,38 @@ test_extra_data (void)
    g_dbus_node_info_unref (info);
  }
-
+=20
 +static void
 +test_invalid (void)
 +{
@@ -80,15 +80,13 @@ index 44cb7a96af45..daca313f77e7 100644
 +}
 +
  /* ----------------------------------------------------------------------=
------------------------------ */
-
+=20
  int
-@@ -316,6 +348,7 @@ main (int   argc,
+@@ -317,6 +349,7 @@ main (int   argc,
    g_test_add_func ("/gdbus/introspection-generate", test_generate);
    g_test_add_func ("/gdbus/introspection-default-direction", test_default=
_direction);
    g_test_add_func ("/gdbus/introspection-extra-data", test_extra_data);
 +  g_test_add_func ("/gdbus/introspection/invalid", test_invalid);
-
+=20
    ret =3D session_bus_run ();
-
---
-2.54.0
+=20
diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch b/meta=
/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
index a61e35ad8a..3acb16f75d 100644
--- a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
+++ b/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
@@ -1,7 +1,7 @@
-From a75052ceeebea434f271b670766acd5416bc83b9 Mon Sep 17 00:00:00 2001
+From 02e38caa6265e25da87836ec46c9e514d4a81159 Mon Sep 17 00:00:00 2001
 From: Philip Withnall <pwithnall@gnome.org>
 Date: Thu, 16 Apr 2026 15:08:10 +0100
-Subject: [PATCH 2/2] gdbusintrospection: Add some assertions before array
+Subject: [PATCH] gdbusintrospection: Add some assertions before array
  dereferences
 MIME-Version: 1.0
 Content-Type: text/plain; charset=3DUTF-8
@@ -27,72 +27,70 @@ Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.c=
om>
  1 file changed, 8 insertions(+)
=20
 diff --git a/gio/gdbusintrospection.c b/gio/gdbusintrospection.c
-index 6f722ee6153d..ed0d291f99f0 100644
+index 78a63e2..4df8e87 100644
 --- a/gio/gdbusintrospection.c
 +++ b/gio/gdbusintrospection.c
-@@ -1110,6 +1110,7 @@ parse_data_get_annotation (ParseData *data,
+@@ -1096,6 +1096,7 @@ parse_data_get_annotation (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->annotations, g_new0 (GDBusAnnotationInfo, 1));
 +  g_assert (data->annotations->len > 0);
    return data->annotations->pdata[data->annotations->len - 1];
  }
-
-@@ -1119,6 +1120,7 @@ parse_data_get_arg (ParseData *data,
+=20
+@@ -1105,6 +1106,7 @@ parse_data_get_arg (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->args, g_new0 (GDBusArgInfo, 1));
 +  g_assert (data->args->len > 0);
    return data->args->pdata[data->args->len - 1];
  }
-
-@@ -1128,6 +1130,7 @@ parse_data_get_out_arg (ParseData *data,
+=20
+@@ -1114,6 +1116,7 @@ parse_data_get_out_arg (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->out_args, g_new0 (GDBusArgInfo, 1));
 +  g_assert (data->out_args->len > 0);
    return data->out_args->pdata[data->out_args->len - 1];
  }
-
-@@ -1137,6 +1140,7 @@ parse_data_get_method (ParseData *data,
+=20
+@@ -1123,6 +1126,7 @@ parse_data_get_method (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->methods, g_new0 (GDBusMethodInfo, 1));
 +  g_assert (data->methods->len > 0);
    return data->methods->pdata[data->methods->len - 1];
  }
-
-@@ -1146,6 +1150,7 @@ parse_data_get_signal (ParseData *data,
+=20
+@@ -1132,6 +1136,7 @@ parse_data_get_signal (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->signals, g_new0 (GDBusSignalInfo, 1));
 +  g_assert (data->signals->len > 0);
    return data->signals->pdata[data->signals->len - 1];
  }
-
-@@ -1155,6 +1160,7 @@ parse_data_get_property (ParseData *data,
+=20
+@@ -1141,6 +1146,7 @@ parse_data_get_property (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->properties, g_new0 (GDBusPropertyInfo, 1));
 +  g_assert (data->properties->len > 0);
    return data->properties->pdata[data->properties->len - 1];
  }
-
-@@ -1164,6 +1170,7 @@ parse_data_get_interface (ParseData *data,
+=20
+@@ -1150,6 +1156,7 @@ parse_data_get_interface (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->interfaces, g_new0 (GDBusInterfaceInfo, 1));
 +  g_assert (data->interfaces->len > 0);
    return data->interfaces->pdata[data->interfaces->len - 1];
  }
-
-@@ -1173,6 +1180,7 @@ parse_data_get_node (ParseData *data,
+=20
+@@ -1159,6 +1166,7 @@ parse_data_get_node (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->nodes, g_new0 (GDBusNodeInfo, 1));
 +  g_assert (data->nodes->len > 0);
    return data->nodes->pdata[data->nodes->len - 1];
  }
-
---
-2.54.0
+=20
diff --git a/meta/recipes-core/glib-2.0/files/relocate-modules.patch b/meta=
/recipes-core/glib-2.0/files/relocate-modules.patch
index 421dcb8f9a..6c982ca735 100644
--- a/meta/recipes-core/glib-2.0/files/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
@@ -1,4 +1,4 @@
-From d99e85f606530950514446a3113fe39c8c67934c Mon Sep 17 00:00:00 2001
+From 226f4955e53c6b3f360f346e41a0a22b74cbbaae Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native bu=
ilds
diff --git a/meta/recipes-core/glib-2.0/files/skip-timeout.patch b/meta/rec=
ipes-core/glib-2.0/files/skip-timeout.patch
index 25f5324784..7bc83adf6b 100644
--- a/meta/recipes-core/glib-2.0/files/skip-timeout.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
@@ -1,4 +1,4 @@
-From e19423cec5b32bfa5ff1bcd567e51fa55713f94e Mon Sep 17 00:00:00 2001
+From 64e957f0fb32ed54748ceb4f220cb4773743d6ec Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 28 Mar 2024 16:27:09 +0000
 Subject: [PATCH] Skip /timeout/rounding test
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.2.bb b/meta/r=
ecipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.88.2.bb b/meta/recipes-c=
ore/glib-2.0/glib-2.0_2.88.3.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.88.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2=
.0/glib.inc
index fafb7e3391..6759ce328a 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -235,12 +235,13 @@ SRC_URI +=3D "\
            file://skip-timeout.patch \
            file://CVE-2026-58016-1.patch \
            file://CVE-2026-58016-2.patch \
+           file://0001-gio-tests-services-Fix-installed-service-file-using=
-.patch \
            "
 SRC_URI:append:class-native =3D " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidf=
d-features-on-native-g.patch \
                               "
=20
-SRC_URI[archive.sha256sum] =3D "cf3f215a640c8a4257f14317586b8f1fdd25a10a93=
cb4bdda147c0f9ad88e74f"
+SRC_URI[archive.sha256sum] =3D "ab24d24e698dfa1e408b7bcdb508f4aafc906185a8=
b8ce72fdf79bbbdc9b383b"
=20
 # Find any meson cross files in FILESPATH that are relevant for the curren=
t
 # build (using siteinfo) and add them to EXTRA_OEMESON.

