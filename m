Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F704C88E56
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 08:51:34 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35180.1789116684266431753
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 01:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=emBgeKWj;
 spf=pass (domain: est.tech, ip: 52.101.70.69, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UeLkKLTaBl947L5oKLZw6YyBZmz5k/gXoPVZ2V5q5ANKf9WhkLnG44jNUB1L95QabR4Y9zXnvAGIzLB8fSjYS/+uyWC3hWi77dcqPdPByIYqgj41F/zslTT2yU9fyJSOEdHs2z1GDgJZqY9rUQAuEu27wf8pzScFuSfZOqngQb0ouIKkRsXeb0uxdqkvu827WdyV1rjrlZxXPo7AsYrL1+zIcTK7FGtJSqTaKXUaRahW3hR1UuanlPETybargSWpfLAxUK+JVLZk30xh0J77X+x1de5ED4hcbx6xyguzhXmbKKsbDWjzH0eUUaDM7VJPabfcua+7wIAdgz50H0FLNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jly2rS8O8ZIVIW6Gtd9IW0CnCDvmIQ7QrhXwFwZHXwQ=;
 b=R+r2dVRlmTstFw3ULT/jaUFCTW6W0UBh+aiteqeWhnRZoplyQkOBKbEqPEqcb2gNTsJmFprGlGh4Ef6qED/2mDMBvxq9siL8qDP4Y7obW5jyOuFSintmgJ6l9+KuAEMFKsdvbBf2jrmVplxRRrDBetV/S3IWL9KTO3z6PrGz96j7lfFXELptzZnrgu/BvWVld88FwTltXykkmms6Jl1wfWLJ5uNQ78e5ykkMgJgvifi6Iemef/DKiV02KrnmDwOa+tmDYlhK5LqUA1B9uyfMHZ/DaF4YsBVhWPOROh18UP+yud0QyCmipKTONy9ofjZ/FAc1sQWOlmo8OUch4zth0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jly2rS8O8ZIVIW6Gtd9IW0CnCDvmIQ7QrhXwFwZHXwQ=;
 b=emBgeKWjFFBWsO4AUqkfzHDpvWiJtASJhIP1TDG3chQShJzJJKKneB2XAdzm5E3+vqB1nOVaEQJysH0M9OioSvO4Xj3JOcZ1ixowEsY8BP6VmeJqgQ9N5FziLs7LiYxWWojC2XFfSJZcdyAozadO7yeVGVlGdTxE3Xkb7fuxEr+93R+r6EE5IvmA/LMymhgOxUM6IW9H362vXILA/uizLF9pMRWxWieCawJRYVnZXDzVLM325XGX+Vgr9ez+OYqzk9ULPLxiIOSX95vtrlYIj/pLRq0o6gmjP2Z6KLtwIUF7EqtZSEs7CN28uCkdrk+vecHVVrxHwXzgR57IYHv24Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by MMZP189MB736094.EURP189.PROD.OUTLOOK.COM (2603:10a6:190:51::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 08:51:21 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 08:51:21 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] epiphany: upgrade 50.6 -> 51.0
Date: Fri, 11 Sep 2026 10:51:17 +0200
Message-ID: <7617622fbf8dc6a97c32605ef2e408d77d1c2599.1789116540.git.jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1789116540.git.jaipaul.cheernam@est.tech>
References: <cover.1789116540.git.jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0053.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::11) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|MMZP189MB736094:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ace5c6e-f8be-4e0f-69cd-08df0fe1da47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|23010399003|10067099003|56012099006|11063799006|22082099003|18002099003|10062099007;
X-Microsoft-Antispam-Message-Info: 
	GRTVBFy8P6rRUc1fsuV8/8CDzYdCF8TYpz5NWYEdOqmtoNSdaFyIsKCSub0hoU/lioeywC8aEPLW7gT1z4QTkRFJW3r4DDH8R+cVkkOYkBKvXrEmHRgrE1vwEMnLG5ylDl2Mqw8q1u1O7iK7Nfds3Yt1KSaQiEH1Z8N1bS93JpxB8MTn80NWcY1a0RN9zqrmfUUeCUtRDpvElVt9EBeQG9HyBGGoacCQry38Xu6FQm2eS5L6JzGyGnmH93kODke4cDsRhAbnJxWXqfESkH7H5JOex5FZWTGkxhfqz6PJGkdoaStroZjzEijQMnRzaUsAdGCX+aC35/DUaxaC4f892xBz4ZZBAXA6LTB6mjNcZxtdSAZ6S5fwSDRqPfVuxdLqz56tAYsL0t4MDG2FL3Ha6LW+hWyre31pVtisZHA3N1vhGkLoCMea3rHBcM41gymQQJWfJQMWsJSfqAbYzh97h5LXv7rh5YGNdvd5om5TVLiDRTAdRN37aOpm1ySya4D42MPi3jRYR1QICzKMqG07HX7a0Zo9TdfJ+UEkkbrU+loetkqxtcjcT9HWE48cN9KMEv2I3jvNjv6FwgXtNG+3/j2XPinkEqb83T1xvZTuVY1v3lsQIgE3I2mrQKNZXEX7PmIwAfjF2QhhRvLRcqiJ54ysfiUSag1XgYvZGNHiP8g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(10062099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jEhfQYmuaEwqI7ZU36w2s25S9pGqlVrtOCchdjRm42paEVU5rCBtPhVaYxix?=
 =?us-ascii?Q?hr2WZmBkSgbb1jfZyTzciG36XCsj8TG/a09bVhxHZ4vWtj+KBEpiwzCDYSDH?=
 =?us-ascii?Q?eEt67AZBFinTCsad+Ylrm3TqLzH5j8PabUzSZIcQNOg/cpLpK5Lx2/9qVVyb?=
 =?us-ascii?Q?dpnVwg7bGjgEdP4yEHaIyb7bu3QoFtBsa4T2klffjoIVPacp50Ef5+hEi2W2?=
 =?us-ascii?Q?12tpRrA3zxdj8pscnHY4Ma+WjGUIj+aMkSSwWOGbf9MOlRJiYtSKyZ7tUiWc?=
 =?us-ascii?Q?vHqz3lxGvkndP/CmPVphsDmNzT8WLwhbAiDUkcuFqOobaPiy//TtZXD4XM1r?=
 =?us-ascii?Q?oucFljY57C38qHuUNG/lNB8A37TdGs3tDgWH+W4uOI7msO0hR6u5/p/1YiuH?=
 =?us-ascii?Q?943BH38RfazGaLjeo8viY1gQnz3jrS5rAwBaRuIsdZASSJbPYs2HLPW/nWCf?=
 =?us-ascii?Q?T0V2eBA99+JDXLA3CffFmixr/ZRhIBxbCXCFCybzQPxnfJLUtvnDcBvEDdrS?=
 =?us-ascii?Q?OG4zBPk335qW4rmFqX+jY4oWDnUq9W/2kcSxk96FwUaO2ZoXzBSqKRmSm8K6?=
 =?us-ascii?Q?z9+P2tqMY0RTB9iZuyii2Vp7JWbvbIb5wlKxWKclNKPHJtdFB1kdPER/2T+/?=
 =?us-ascii?Q?kpwXLB5MonvsGWc+2Zl53N+YApbP7lEin7e09uP9hFif9oqlf1P4/JtMc4Zy?=
 =?us-ascii?Q?Fl9solERtLwPH+qYP48/ZkCRvM1wexiy+v+N/jvq81X9xM6VYm+46p7bPdmY?=
 =?us-ascii?Q?n/FTyMJUQ0d4oXi8MEnbkGrL4xaNxss++7sBF24nvdAxFms9NvGHJ/tLRZgX?=
 =?us-ascii?Q?h7SA6lc1KBTiViH5tw+Py52kHcZKOttHIvVkT5ZSDbIWTkvumucIsktIaiut?=
 =?us-ascii?Q?qTovICJoCdhW0I3opL3a+18ouDl1ENq+LhB4a+lIL2Hr64tUjcIznmNye3an?=
 =?us-ascii?Q?V05wsftv0Ck9X+LpDg/Le0ZzZMmifL9R6wolBs5C1hkqOFKY2A4fLskB+Fqn?=
 =?us-ascii?Q?4vN92FHJK6HKD/KGCrWwl6BsLoJr+O0gXPdwiAXZQDrKvm0ZSi6NCLVx43D6?=
 =?us-ascii?Q?JcLb4hjBr0YTnzsk0zlXtfn5AKXX8I9hUeukTlU2DZzbg7GbkINSBg24gumj?=
 =?us-ascii?Q?Mtrkzm70GxLowGX4XmUK8YNp/jKm+Mnj/948eMJu7q5z3Y4mujJSPOhJDdek?=
 =?us-ascii?Q?S2UefwB9krs/EbQWa3t8GiMu3OK3qwOFJE+MalaIx7/kdL2vWTypD5N4KMqi?=
 =?us-ascii?Q?RUTsFJcngsf3zY8Y7lojMAhyEJE+nhYswuDHEENaeUqCd+LPYMEX/8dWAuay?=
 =?us-ascii?Q?HtWUM6Aa/VU5FqjTmzUU+w2x36JXwrG2WXGZLKdmQqTIP2Hq2MUhU8FIPoix?=
 =?us-ascii?Q?J22g6u27DEcJ/Siy6EHXTydbocgKhoqqAKux7TrhccQgk2GnHSeoSCoqp0mp?=
 =?us-ascii?Q?q1dTJRpoE9rfnlisHq1aYE7elzhXVGgI9ZAUSCcDWetDm0obQC7ZIEG4aUBi?=
 =?us-ascii?Q?8rX7tJS1eJxsd6DZOXnvFoFD8i8CNKqd2SfgWX9ALFNfEfGQIA1+EDQi8Mux?=
 =?us-ascii?Q?2QMuryQuhRzGwXliPqsX6xYS+bLByXNbjsu3g/U5HcH4IkIKlznw8w14ZPdH?=
 =?us-ascii?Q?N60UqemRcRqKDwNKthd5fZXBu4FCcBUfB6/01C8e0bjvhmlLNctXrPKz5QzR?=
 =?us-ascii?Q?ctGJqnHuIxrzgt+xy67+BFv86QcdOaEfvBBiUK255zzzrxL3CYS/9A5qnBc+?=
 =?us-ascii?Q?n5w24JcG52oxRrPN06fMELbdDJwBL5U0Aw5FqrMkMQqHBhiW/4+gIKoeq4IJ?=
X-MS-Exchange-AntiSpam-MessageData-1: J+OlaPprEL6ySbvrlmaUFwlbHQQK2WHRTHw=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ace5c6e-f8be-4e0f-69cd-08df0fe1da47
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 08:51:21.5338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u5Fa3lPDuWWmFzgizbwzK3cOYR91vgrRQ56SYmYdLPoRwgZJB/VpaZMzeq92FI8DQFAfRz03Tij1H05Ysy5dkdaDJGDy+y5bakJb60s9hRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZP189MB736094
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 08:51:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245623

CompareLog: https://github.com/GNOME/epiphany/compare/50.6...51.0

- 51.0 adds a new mandatory dependency on pwquality [1] so add
  libpwquality to DEPENDS.
  libpwquality was imported into OE-Core in the preceding patch.

[1] https://github.com/GNOME/epiphany/commit/683e9a076fa3

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../epiphany/{epiphany_50.6.bb =3D> epiphany_51.0.bb}         | 3 ++-
 .../0002-help-meson.build-disable-the-use-of-yelp.patch     | 2 +-
 meta/recipes-gnome/epiphany/files/distributor.patch         | 4 ++--
 meta/recipes-gnome/epiphany/files/migrator.patch            | 6 +++---
 4 files changed, 8 insertions(+), 7 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_50.6.bb =3D> epiphany_51.0.bb=
} (92%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_50.6.bb b/meta/recipes-gn=
ome/epiphany/epiphany_51.0.bb
similarity index 92%
rename from meta/recipes-gnome/epiphany/epiphany_50.6.bb
rename to meta/recipes-gnome/epiphany/epiphany_51.0.bb
index ad0fad1a65..63ec9bb100 100644
--- a/meta/recipes-gnome/epiphany/epiphany_50.6.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_51.0.bb
@@ -15,6 +15,7 @@ DEPENDS =3D " \
           libadwaita \
           libarchive \
           libportal \
+          libpwquality \
           libsoup \
           glib-2.0-native \
           coreutils-native \
@@ -31,7 +32,7 @@ SRC_URI +=3D "\
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] =3D "458222a8694cfc914e7a2d6de9879067001a8d65e0=
0a907d96112059c67ad446"
+SRC_URI[archive.sha256sum] =3D "abaf33576462030c65bb963a56300a7786e7d75834=
f1c90a9dffda873835c33d"
=20
 export GI_TYPELIB_PATH =3D "${STAGING_LIBDIR}/girepository-1.0/"
=20
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disabl=
e-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson=
.build-disable-the-use-of-yelp.patch
index 12e9d98233..bdb06e407b 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-u=
se-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-u=
se-of-yelp.patch
@@ -1,4 +1,4 @@
-From 9e51ca47efc74fedb420e6b66436569d56623e2d Mon Sep 17 00:00:00 2001
+From 2bb52be1e80d1f4693a383be8270e80ef1d9586a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/rec=
ipes-gnome/epiphany/files/distributor.patch
index b16552bfc6..8677f1558c 100644
--- a/meta/recipes-gnome/epiphany/files/distributor.patch
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -1,4 +1,4 @@
-From cc0b9a6904297387068274c802784eea740782a1 Mon Sep 17 00:00:00 2001
+From 2f52672597ab74cb17e41d308f8d9934c25d8fc0 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 26 Feb 2021 10:17:52 +0000
 Subject: [PATCH] Don't encode the distro from /etc/os-release into the
@@ -11,7 +11,7 @@ RP 2021/2/26
  1 file changed, 1 insertion(+)
=20
 diff --git a/meson.build b/meson.build
-index c02b591..8af9fe7 100644
+index 8aec3cf..4a06ab6 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -15,6 +15,7 @@ if r.returncode() =3D=3D 0
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipe=
s-gnome/epiphany/files/migrator.patch
index b20cc3058b..dcc162040a 100644
--- a/meta/recipes-gnome/epiphany/files/migrator.patch
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -1,4 +1,4 @@
-From 12ead2afbdab96eeb6bac820c39c1e951a047c8b Mon Sep 17 00:00:00 2001
+From e336c2dd1368aff496a6ba01e2ca9ca7e88860a2 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 25 Feb 2021 14:52:32 +0000
 Subject: [PATCH] epiphany: Fix reproducibility issue
@@ -14,10 +14,10 @@ RP 2021/2/25
  1 file changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/lib/ephy-profile-utils.c b/lib/ephy-profile-utils.c
-index ea2ea99..13c27c8 100644
+index 1966108..24d4364 100644
 --- a/lib/ephy-profile-utils.c
 +++ b/lib/ephy-profile-utils.c
-@@ -130,10 +130,10 @@ ephy_profile_utils_do_migration (const char *profile=
_directory,
+@@ -131,10 +131,10 @@ ephy_profile_utils_do_migration (const char *profile=
_directory,
    argv[i++] =3D NULL;
 =20
  #if DEVELOPER_MODE

