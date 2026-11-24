Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14142.1795510425247227134
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 00:53:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=vEdg5NLM;
 spf=pass (domain: est.tech, ip: 40.107.159.45, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E9zh2dMlX//S1Z1mKA3V2BJp9912+xfRRCOmKFKAHEN3uJx/1f2MImAd7Zn+D+YTt29wbyzeynv2VyRYIJFcTLF7has5sf81JhXiCZlrDeWMGCRafovs/eQ9E27w3OmSqkyzaDOIaSB/k58ywTpmFFMPTX7vdvc7hbmtGQEhiQs0ycoRy1s6mfX6SuS8FA8K54dfwQL14jjcyC799AmPX908zTQySxgqKtS8SaUM3rMSU2NsVFrddVWdLx9Q1JdAMyewb2Q4rkKvQdigyYQon0TTztDA4EUrQddsoJlW49t2hEam+iZ0L0dW0B/4Daifw8OoMDWHHJJZX47A5TrzJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kXxCggfkNBhiTsbRpRopZegcRtoK774HNfZklbQWP20=;
 b=AS8N0wCHI1BFN9wbcPYu/p2J23O5lPjqGZddC1iQzGAytFKULNkyFbYT6qHelSO+bxpWTD4sgC9u3UpfFFSDrueicagRn7krDe+yKpCh/LBow+o7LNR75RARb9U1cHpdr5yBC0y5zbdU+DSh3mVNnJL8nhP8rnsa4V60yU2dF5QH7wrGhjOjk+GUJbSuhdmYtMmK8YPx/d27GjeWgTQsZZEJ2CudSUSsi0kvU6W2Dz2/BISZFFsxnklTA7B4tXkEjR4Clyp69cyzKTvE9vhYRjPOp/3+ath3tTAytBn78UApNbm0wRRdtESdZpAeCgbowac57gIw8FSPz6kVSp13hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kXxCggfkNBhiTsbRpRopZegcRtoK774HNfZklbQWP20=;
 b=vEdg5NLMkU3tf4iOwqviIxcjrBIhQnazX2v+TrRTRQ0EPSXiptOArgsf49wjkC8P5fOdGm3qr+iV8eLrsoQwqwtHHc+xTY/iZeMRwS4piXDphbaV0Ef56xO3J3RgCxCnu8Ech0oNt3DcYaWftKZ4kTquyFuGdGn+4RVTSli3k5qLqCSWM/mGYtUeRZf4Wi55v/cLnUk6ISnWU8r6kXEGuNn/gZOJqLoj/anAIZc/7b4usLByoAWoMzGpQQWN6y1hOrlyvo4iX50gqWryrWWnEra9+ZyzRvIWi+m0Z35gddKnzUp/C0c3Tt728GGsARmL98Qq3WOBquc3uAySnWceHA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV2P189MB2211.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:7b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Tue, 24 Nov
 2026 08:53:40 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 08:53:40 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: adam.duskett@amarulasolutions.com
Subject: [PATCH 1/2] dnf: Replace systemd unit dir patch with EXTRA_OECMAKE
Date: Tue, 24 Nov 2026 09:53:34 +0100
Message-ID: <20261124085335.68851-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261124085335.68851-1-jaipaul.cheernam@est.tech>
References: <20261124085335.68851-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0087.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::18) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV2P189MB2211:EE_
X-MS-Office365-Filtering-Correlation-Id: 98eea0ae-fc1e-4a2e-a665-08df4a086f55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|6133799003|261009223027099003|261022075727099003|11063799006|261026140227099003|10067099003|56012099006|261102123227099003|261028144727099003|261026121527099003|261022105027099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: voqTLCggemxSUM/f2mtt09FFcS9cWKtruZVFBTveyU03cTdtrpNHYqWnnrbV46BLgqZ6WWNgC5rHRm5DoOQsZ7sgdsbak++AdIi212t4zoImcPgDasnFy/pBoGsIOOZeKyCgh6qkPPklAgWEWcWXdA/CfDnMqIdfmOXo6hyn0w/V4lQSRYXAAuhYNKrw7IE7KzrGylRLXeiGws62SZm1xvARVdj7K/4UKR6FDmbj+iOcGD+uThJLWVeFImF4VrHBcNr+Tqvsb3GOGg2H+WKMUKHtKFP7lx2yatOCbFr/x3533yiP2szwus9NiMHU683WuMMK/e7gGk92nTn1dvwGyuxbqV8pD2QpwBsclQgxQSFTO/9j5MGUX50Pc1RgBqt2neJqUZhoT2TdVqGSFrp0pybZG9BNw2GU/eKOODERwPiXP4lg6HxiCzN+5c8AI5KD+qzzG4WzYii6BS3s+OqA2stSYY+28nAwWVJLLJ8BuBuVkkWhut/6zF/aXBX0z6rX5QRT0vcb94gU1fflzJLVbupJz6/w+7+GV3Qj+UzpyEYuEtjCpaFUPtDqYXXY87CH/PkIa/eU8dlLl5V/AQ2Ry7U31m9phtMS+89NAc1bj94Ml4AseFQ6PykGBJhLE9mQA5+D+I4e2MSi98E5g5+beMwkvn6dVRvxBOpVMPYurpM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(6133799003)(261009223027099003)(261022075727099003)(11063799006)(261026140227099003)(10067099003)(56012099006)(261102123227099003)(261028144727099003)(261026121527099003)(261022105027099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pFTTcZUxvCysKm/BUiw9naBpCYX/w0wAg6AIND3y4HXM03QhniuzjQXvSqOL?=
 =?us-ascii?Q?zPJvLSlnHtWgmprEY/nIhGHkcfHDzdOCIgok+GUfXgOKxPvJA3cmM8HM5zPz?=
 =?us-ascii?Q?UHfYD5J5saUstv7i6tm0z2sTc3ntQf3H0Yw3lSYj7F5I0K1QHpbbxnBvN22T?=
 =?us-ascii?Q?WuQChzvorsTekzyEfPR1eorpB/RFLxePLvfBSZMj+vQMQsLiMk4I0ABhlCNE?=
 =?us-ascii?Q?0p3D69A6qFeP1Pt8FirNeGnbCmhmn0zneZVOGCx+ZdKL1dLB/93WjwA8ji2V?=
 =?us-ascii?Q?H6jmFsdUa3n9cNi/BglDY+oJKKwAAV0vkXsJ/Ma9O0yIBRrsDnvlukQXqVZv?=
 =?us-ascii?Q?A/7o9zcRNUaJtyMIDanqj+8QvgXLBXSXTu+eXnPiszqLE8nslu+nOgnECFWC?=
 =?us-ascii?Q?g/EWCPfPTFEApVLTdK85eDfPvw0RqH+6mPS+omeuZtmHtLatBbxF//E/BoDA?=
 =?us-ascii?Q?2mKr2+Pil8IpZINGEI2ENGcHLE0LMl0nKxHaCMy0licialPjowkRqNZ5+9+W?=
 =?us-ascii?Q?asmR0Bt7I8xXqGc0gNAV9lg/wUIbUnS8cFWXsfbenV3Pvml+obqwEkTrIlFm?=
 =?us-ascii?Q?u0bYYLLoU/Txvw0lcYEfJyWWbv1d4BJaZH+ax+fHkWBzjL0jNmRsGfkyRmFH?=
 =?us-ascii?Q?dnb39z7WdJesAMqgd4fKKacAZcmP7ycKcNgFevx6TsxzA2BTSLmpTx2XEZNZ?=
 =?us-ascii?Q?OKTwpxXCxAqX7y63MW89290+GaEM6F/Go++bwBS/w/bv4QRgR3iLeZ261Bjw?=
 =?us-ascii?Q?uHUCmCKxYHnCZ6vQz2eXovQrkysXawvlxnuCqF9i1VeQKrUyTgSR++eBXVVl?=
 =?us-ascii?Q?DhwArufqLg63Ll3BpUnrzGWWNz1gpuVPUFP+24MNkOCWzeJKN8ZjKGktrg0q?=
 =?us-ascii?Q?c5fy0KgvOjBPnGGvGkTGsA9+qPJHbRJ3js3KNBi372yYUvpqKWc2JDCLdOfe?=
 =?us-ascii?Q?Re1dOyljX2npfvjgl7BfVyZmpLZU65KxbtphJp5mrDHhjYh1MUVrJMzwv2Cu?=
 =?us-ascii?Q?8oDG+18+E+ln0f/6uJNcOwojFcv7QLDvJuHSudYbOzaiJLYFEAqRcx2nqhCW?=
 =?us-ascii?Q?YKAUv1mLBYInDJGOHJWXoeYk/kpDN8iBwCjCbI9Wu5B+Ny7C+VCSBIzHT8Xa?=
 =?us-ascii?Q?vAll+4hqGgRgf2u+2GwRbLosN+W2ahy5956dvqZlmA4bKECRTBc66RRoMuku?=
 =?us-ascii?Q?QDIUX0HAOR4NtSKLPado9EHspSfYLnGnwTX1jukisavAdaenwROcm43Rpgj2?=
 =?us-ascii?Q?VUhxPWs5tb7zJ5G/YUWBknWCsFYUmvIFov5epI52km9QY4P+NLO7KV3Oe7fy?=
 =?us-ascii?Q?Vba9HuMEPHg3RJZvKs2/w8i5YsA75KpiSvpoJGS90sYHdLpy/eNbw3v4YdnN?=
 =?us-ascii?Q?ao7NJS3TKwPtneBAtFehAq41P2uvZVxcd4hXTDD6is4rQ56O4tcwYT1XSHSc?=
 =?us-ascii?Q?bUjv7SSZKGSqaFtlDAcMSxESXHD+59NzVweuSfl8uvrvIMcgH+9YzKp3ojBx?=
 =?us-ascii?Q?RU/HouQTkPf2yWtlqTDrWgS19oDDZyyu9JTLaROj86zoddsRpDMpNYcVpkcg?=
 =?us-ascii?Q?UQFbmF/ihrvKBGQertJelDuS2LOIYpbaPCvjzD7ylmdodnWOgi0v4+lB1PLd?=
 =?us-ascii?Q?DUrG9zRXEtLBBlNTa62JB8qSfJTrr5DpjdldxJgpmbCldg87G7qIIANQIh8c?=
 =?us-ascii?Q?mlfXTu4OCtDYLlY+WoymgHSBFgUOoWayasN6VVv2nED2ZcSN+LgAS6MATEOF?=
 =?us-ascii?Q?9lng+eC9SQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 98eea0ae-fc1e-4a2e-a665-08df4a086f55
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:53:40.0069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dhHdRcsZ39ZWO/kOxsKNsoBaa9ARa0p6T4xVJGayq1pHw9tRZY1lh6s4UQSAQqQ3FQm2QtLrA4Ov823oPQ4YuMjFrj7XKG4aEjuprliKR2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB2211
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 08:53:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250980
Content-Type: text/plain; charset="utf-8"

- Drop 0001-Do-not-hardcode-the-systemd-unit-directory.patch and pass
same as EXTRA_OECMAKE as upstream supports it through CACHE variables [1]

[1] https://github.com/rpm-software-management/dnf5/commit/4e1aa3f0ef555b9c=
003a0ca5c3ca42e0cf214be5

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...-hardcode-the-systemd-unit-directory.patch | 29 -------------------
 meta/recipes-devtools/dnf/dnf_5.4.8.0.bb      |  2 +-
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-the-=
systemd-unit-directory.patch

diff --git a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-the-systemd=
-unit-directory.patch b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-=
the-systemd-unit-directory.patch
deleted file mode 100644
index 4360139a26a..00000000000
--- a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-the-systemd-unit-d=
irectory.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From fd24b56096d436da4ffe5e560ac3aa34000a4d2e Mon Sep 17 00:00:00 2001
-From: Adam Duskett <adam.duskett@amarulasolutions.com>
-Date: Thu, 15 Oct 2026 11:54:09 +0200
-Subject: [PATCH] Do not hardcode the systemd unit directory
-
-Upstream-Status: Inappropriate [oe-core specific]
-
-Rebased for 5.4.7.0
-Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 9bc01ee..6fbc338 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -7,7 +7,7 @@ project(dnf5 LANGUAGES CXX C VERSION ${VERSION_PRIME}.${VE=
RSION_MAJOR}.${VERSION
- cmake_policy(VERSION ${CMAKE_VERSION})
-=20
- list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
--set(SYSTEMD_DIR "/usr/lib/systemd/system" CACHE PATH "Directory for syste=
md unit files")
-+set(SYSTEMD_DIR $ENV{systemd_system_unitdir} CACHE PATH "Directory for sy=
stemd unit files")
- set(TMPFILES_DIR "/usr/lib/tmpfiles.d" CACHE PATH "Directory for systemd =
tmpfiles.d files")
- set(AUTO_IMPORT_KEYS_DIRS "/usr/share/pki/rpm-gpg:/etc/pki/rpm-gpg" CACHE=
 STRING
-     "Colon-separated list of directories of OpenPGP keys trusted by auto_=
import_local_keys")
---=20
-2.56.0
-
diff --git a/meta/recipes-devtools/dnf/dnf_5.4.8.0.bb b/meta/recipes-devtoo=
ls/dnf/dnf_5.4.8.0.bb
index f2107016e4e..9536552c3eb 100644
--- a/meta/recipes-devtools/dnf/dnf_5.4.8.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_5.4.8.0.bb
@@ -39,7 +39,6 @@ SRC_URI =3D "\
     file://0005-libdnf-fix-arm-arch-mapping-issues-for-qemuarmv5.patch \
     file://0001-Do-not-hardcode-etc-bash-completion-directory.patch \
 "
-SRC_URI:append:class-native =3D " file://0001-Do-not-hardcode-the-systemd-=
unit-directory.patch"
 SRCREV =3D "01329a46d840894d9fac207f06ed5bc37e752612"
=20
 inherit bash-completion cmake gettext pkgconfig siteinfo systemd
@@ -99,6 +98,7 @@ EXTRA_OECMAKE:append:class-native =3D " \
     -DWITH_DNF5_PLUGINS=3DOFF \
     -DWITH_PLUGIN_MANIFEST=3DOFF \
     -DWITH_SYSTEMD=3DOFF \
+    -DSYSTEMD_DIR=3D${systemd_system_unitdir} \
 "
=20
 # Create a symlink called 'dnf' as 'make install' does not do it, but
