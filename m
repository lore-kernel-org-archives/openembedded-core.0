Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F18BBC982D2
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 08:29:19 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6653.1789720155303579101
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 01:29:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=p6SnBhva;
 spf=pass (domain: est.tech, ip: 40.107.159.52, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYM7tPEVG2UwEwk7h5Ffy60BzncwgXnWEc088so1umUw1XzXm4Oxic1XF+g3BAIOO8AAl2k1xNYd52Oqc/mPedkCWcSILOKi8o1yL7CfyOQskDHUN+SRP3r0xezwUL1l2VSK+FPY7u8MuQpGgF/tGbpTTAWj2syeNPddnxarEJ5mEngFIegw0yazkdcJ570CHVJtVA4eIpkqrVVkTWMhxcxR7fOfhCH0YPjJKBneX0YmjHxg/jxcVpqFtHbudBSk+3nQpa4GzbqFWOLKBV2lW2+lNRXSDLjUHJqa9eV3QUNf+UZToVMKCRAT+J2BSrRoLDOSJLyO7/6KVavc5eIA7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ym07O3+3Xmq1mjVb5P+xOFv3ljdXssZ57sxO5ZpLE7k=;
 b=fLxu7WZtICnfvx89JehmK3KYepd+5KYJDMxiGUopesrCC+cTdNCuKZggO49CSPxLiP+IqeCjV3kamPqms+59IqIC693MpBYEnhxsjEO8AZzg6P+yLNHlWDcdjDiOvsl/82s7VjbqIvAjdXH+wTWC6Qy0GzUd6ljURtMANfiQrQjU04Jjvp63X1bkP78urCv5oARBjGZk6fy2PiY51TccUjGnhSGg3Akkfy9eYYTdmYS0VMVNIBrU8tR5ESnd/oeO/Gw8ISW16ZL1Cx0PpVFQUlZzJLDDEdGSN2960OACyr7Pq2CxB/uWWPyL6n4fFfChCpRxkMCGdfm6c3tLC6lgpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ym07O3+3Xmq1mjVb5P+xOFv3ljdXssZ57sxO5ZpLE7k=;
 b=p6SnBhvaYHX4vFACbMiOFQ1YO/xKQRs9k45a2dZVXVk0hnIButTwXtBGNmoiTV2hSUZXwRALw6ncXqqwFnjPdnGLSoJT3BQyy2aHPRIue5TAgkFNDyqNogfJiTZbi7RCJ0Per/wkvjwtQBB8nzdRZ/d5qJO8KPCK/L5Zu7CDTcaA3Drzf3Lseu7mPzsnGHTzB0MVwFovCVT/MMthgnqwkLcjVLTViWyg/wFAOexI34k4obw/rjbDspSvjVztvJ65CJzw3WGGrAwXtNugjv6UMf6krXNuoJLpKjwu7clXkwhA9+RMuCttEx+B4+d3JAhAOUJbVDajmiYegSSuFZXKXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PR3P189MB0859.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:47::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 08:29:10 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 08:29:10 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libdnf: upgrade 0.75.0 -> 0.76.0
Date: Fri, 18 Sep 2026 10:29:08 +0200
Message-ID: <20260918082908.17467-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PAYP264CA0027.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:11f::14) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PR3P189MB0859:EE_
X-MS-Office365-Filtering-Correlation-Id: 92c5e870-c741-44d3-152e-08df155ee9ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|11063799006|6133799003|3023799007|56012099006|20052099010|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Scr8hvJVX8n8R6xBYEk9hBMG9dodnBXDh+lcJfpmec/FbWdVB39/0L7NIJQDVyXaanmYFajYElI5B0uFkXRhIwqrseIEXKbjE2FqexJkcBjWE6G3jxvnR5IQXAsnbcTIIfrRQiorsFMzM4DZ88exqIfxo7nCpIFRU11a2xn8XrBnhwvts0bDeRBMd0ipNohbiKZxN0B7ljkSMElyrK81ipjJ6xBeVzd8rSn5ok/2gKzx3ZIhpOLqowWoEUggdtFPPWl7o3d7PBWp7DFngMyrVmi9pFO3Uv7uQMlcsBM8YHh3D3vC61CP209Wy4zlTIO7ub7Yto1KveWk3p/dB7ywuFfn8yf6EgtpidVfcOk/DbhcLchIAhwVp15z1gUu7lqe97ep6JqCXe91lAJ6CWNvKhzGMgQzQU8iyNYz9W3LQWltY/6yn7kotbA/1tiU4U/3S2+DNjXxcszfJGmHIQc7vv9aOPvC6GOtFrVHyovK0FozDhFo6iWSmbnwLrxQD5sa+0DO8+sCa4/OWUD3nPd80VEehDNQ+w/F3bi5w1Csh0AsqL3xnuWkeV4yH6iZyOfwHniGWXA30lUNAcKEP0mHZyjBktLDyCP0N/d+vve+KwpHL0/svAL6KCzNgsq4tXhO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(11063799006)(6133799003)(3023799007)(56012099006)(20052099010)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7koOXuJYde0cJc9fx9dp5iW3z2vaaMkcUTFtkG0TmZMblNARHQyJkwxr/DVL?=
 =?us-ascii?Q?2q2QqpiiHpMbV1HU0KTxGNtwr/DCBiNxju4OCzps9MXUpVyU5HdImDgAE+Cx?=
 =?us-ascii?Q?6RDLJny8CKMVEFKjyEOUyAWG+RC6jFi5EvggI0UgKfxC531Aom3aPd7kIxAJ?=
 =?us-ascii?Q?SkBCxYQsamLeBoHrM5WEW9KCh+ulXzwodAfnZ96Wuvd5GUZdTUMJA3zzOKJc?=
 =?us-ascii?Q?RxjLQvU9JT1UlsVDeWG0S/dAH5GSF9XHW8wapFfZKouPFMaBJ314I4gNoiRu?=
 =?us-ascii?Q?kMj7KCAVrP8Sccf04EltZnm8chXw0Br2QrMPxXImqltnXoMAmIZmyKVtFTbA?=
 =?us-ascii?Q?xpQc9K3Gv7pZ3T+hulbajc7/4CEL1b2NvLblXJ05HFW4zM+6SbJUl51UwfJh?=
 =?us-ascii?Q?PKZLXqob5p+cSfskeCB/28puoZhkFWGOZZ5PxWmZRZ82UCGQuSnClehtkqCj?=
 =?us-ascii?Q?9rUb0Vb3WVYO4kfrcwFKlaaKMOP/rxB349AsL95JqrCZcE2nF5AW5Gclgniu?=
 =?us-ascii?Q?0DcX2VeQYGBh26l3jsf6nrqj4yWAQ+6sgvJL0ztbVkt9SrS3X8+DXmapus/p?=
 =?us-ascii?Q?Uxcp1Gi5MXJJNI3UAEcdYbrZQD2KadPcjbYcVTW2WAhUh6nSeSzEzdbsVVU2?=
 =?us-ascii?Q?ggHhF5oBxhGsy59Z+rPseq+Lx7z6cmC8jB7Lvj/cAU7koG4amJyxzEIkc/Q3?=
 =?us-ascii?Q?/SSClY8IvgsR6cqnxXJgCN6J3Zsv4Vck2r/vbeCCkH8v1smC3Nl17CKKbycw?=
 =?us-ascii?Q?ikFbkZUkdkWKu9SqJWqos8CGdjITMdjAQku4Plp9ZWPVz4XcVrK0jbdfwXeH?=
 =?us-ascii?Q?t571yb60FUU/KBvvUYVOwgCKsR0nX4hIhsyoMPSoPE00AmgFF+WErC2mkW6y?=
 =?us-ascii?Q?exXo+N/IkumGmA8/w/0J0ffMMD0mWq+BKDGwswjIHjhEdzSEcjq1TBg6N2mw?=
 =?us-ascii?Q?KTC/JIR89tlD/gARQc6zoGYGwNayE7LgSKp/SgQLZeOVPMFU1D7vZU3VANJW?=
 =?us-ascii?Q?anQHHmkOF1OLkRUHcgAy8B3d+8nHEYDcq2EropO8/1jau47tV2Fcwb0yAsFb?=
 =?us-ascii?Q?ffqxe6AF8Vjo4Iq1nCy67viLNbGyZYSPq5El/RSoOqCODSmX0uYn4fmDyaBf?=
 =?us-ascii?Q?SNGqu4qTic6reZjVaV7vb0TK9+7flO8IL07GKVzVUGArEvAq5/IpXYwC08XS?=
 =?us-ascii?Q?83MOk16Mfnpz4kq55UKZHvBWqBPiKr6454Ln/NvKH7j4Q1sTAMZV7jYi0xYu?=
 =?us-ascii?Q?a4cJ5ENV+HYIhogpD5XoZqn1UhWB7jasFK8rH5yXU3ZaddOllAi+jkDMqofj?=
 =?us-ascii?Q?jsduFbeo141KdEwkpqAKctx7TlMHq7oy/tLNhWpGLgNeKH2Csii2bsXFAxli?=
 =?us-ascii?Q?EMBf/CjmFJ/r6JtezWVIh1sUrWq3FuZEcpBvMUVXeEnl4ILxjfZfBhI1Uw9v?=
 =?us-ascii?Q?xiDyO3DuSAzxUTOsycs3k9tM0+sfC6XTNG8mUV92DPIMbR9sRFqx5q3Hq/FG?=
 =?us-ascii?Q?0z1Fc4ov1s8QiZa0TBEnfSNtfELosXprOIDEX3FiE+oSqi4cWPkay+635M4i?=
 =?us-ascii?Q?QhiACv/d4gD3FTObaskDAM0cHZVh+ZlDhJfHg0xFGSyJEnbdH/ZdtToUrv4o?=
 =?us-ascii?Q?wqEXJpGEAqM1xWc+j2CURzOOXoXTOIr4WCIn1nCARz+mKRgV6IsS1fRVbQX9?=
 =?us-ascii?Q?Hq3l1XH75UaRPP6hMt5kzufTbkZHW9k/5ueHD/mF3A6Gww4hyH0zkxWcfgVk?=
 =?us-ascii?Q?C/9Sm3xOAQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 92c5e870-c741-44d3-152e-08df155ee9ad
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 08:29:10.3150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZTgrhEjBIA7x/qHN/4sz3FZRyZ7y8LZtxAaSOELA9/yBZ9KkUhHRnHtuLBdRseKxg8cZyp00XPfgj5I3cpl3SkUeeBNrJjFI4IwS2FDNZfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB0859
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 08:29:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246198

ReleaseNotes: https://github.com/rpm-software-management/libdnf/blob/0.76.0=
/docs/release_notes.rst

License-Update: Update LGPL-2.1 text to current FSF's wording

- Add `/usr/share/dnf5/repos.d` reposdir
- [context] do not fail on rolling releases with no VERSION_ID
- keyring: Also search /usr/share/pki/rpm-gpg for GPG keys
- fix rpmlog callback truncate corrupts multi-byte UTF-8 sequence
- advisory: filter non-modular collections by module_excludes
- [context] automatically setup $arch variable
- Fix formatting error messages when importing subkeys
- Fix dnf_keyring_add_public_key() to add keys from all ASCII-armored block=
s
- Fix dnf_keyring_add_public_key() to add all keys from an ASCII-armored bl=
ock
- Log identifiers of keys imported by dnf_keyring_add_public_key()
- Add support for E2K architecture
- Clearer error for protected package broken dependencies
- Describe all problems even when there are protected removals
- fix: compare RPMItem in transaction with rpmvercmp
- Add `filterUnneededExtraUserinstalled` and Python version to the API
- Mark all protected packages as user installed for all transactions
- Enable implicitobsoleteusescolors flag.

- Refresh the existing patches

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...ameters-for-both-libsolv-and-libsolvext-libdn.patch |  6 +++---
 ...o-Define-FNM_EXTMATCH-if-not-already-like-und.patch |  7 ++-----
 .../libdnf/0001-drop-FindPythonInstDir.cmake.patch     |  2 +-
 ...001-utils-utils.cpp-fix-compilation-with-musl.patch |  7 ++-----
 ...solv-variables-with-pkg-config-cmake-s-own-mo.patch |  6 +++---
 meta/recipes-devtools/libdnf/libdnf/armarch.patch      | 10 +++++-----
 .../libdnf/{libdnf_0.75.0.bb =3D> libdnf_0.76.0.bb}      |  4 ++--
 7 files changed, 18 insertions(+), 24 deletions(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.75.0.bb =3D> libdnf_0.76.0.b=
b} (92%)

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-bo=
th-libsolv-and-libsolvext-libdn.patch b/meta/recipes-devtools/libdnf/libdnf=
/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
index 54b1262672..f56e3ecdf9 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libs=
olv-and-libsolvext-libdn.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libs=
olv-and-libsolvext-libdn.patch
@@ -1,4 +1,4 @@
-From cd8a24156cefab80b673af233f66ff44c1b7c458 Mon Sep 17 00:00:00 2001
+From cd297017bc4013764915dfc1e47d23fe193bc062 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 7 Feb 2017 12:16:03 +0200
 Subject: [PATCH] Get parameters for both libsolv and libsolvext (libdnf is
@@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index a6f14318..60c66e94 100644
+index 6c866111..c56b6bab 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -51,7 +51,7 @@ endif()
+@@ -58,7 +58,7 @@ endif()
 =20
 =20
  # build dependencies
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-dnf-repo-Define-FNM_E=
XTMATCH-if-not-already-like-und.patch b/meta/recipes-devtools/libdnf/libdnf=
/0001-dnf-repo-Define-FNM_EXTMATCH-if-not-already-like-und.patch
index 14ef362ccd..2b64176317 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-dnf-repo-Define-FNM_EXTMATCH=
-if-not-already-like-und.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-dnf-repo-Define-FNM_EXTMATCH=
-if-not-already-like-und.patch
@@ -1,4 +1,4 @@
-From 486d1c7826efb9e42bbb18b6537fd23a0a33b324 Mon Sep 17 00:00:00 2001
+From 09c7188880ca62248e7c1e8e907df66545bbc3df Mon Sep 17 00:00:00 2001
 From: Wang Mingyu <wangmy@fujitsu.com>
 Date: Sun, 16 Nov 2025 23:29:18 +0000
 Subject: [PATCH] dnf-repo: Define FNM_EXTMATCH if not already (like under
@@ -20,7 +20,7 @@ Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
  1 file changed, 4 insertions(+)
=20
 diff --git a/libdnf/dnf-repo.cpp b/libdnf/dnf-repo.cpp
-index 44c0f8758..d53959414 100644
+index 21d23e0c..dd91b816 100644
 --- a/libdnf/dnf-repo.cpp
 +++ b/libdnf/dnf-repo.cpp
 @@ -69,6 +69,10 @@
@@ -34,6 +34,3 @@ index 44c0f8758..d53959414 100644
  typedef struct
  {
      DnfRepoEnabled   enabled;
---=20
-2.43.0
-
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDi=
r.cmake.patch b/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonIns=
tDir.cmake.patch
index 850a862979..d3a7583eac 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake=
.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake=
.patch
@@ -1,4 +1,4 @@
-From 5150fd9be924d2e9e74b2db664229423a4a00238 Mon Sep 17 00:00:00 2001
+From 178a1358aac59f0b06184bd60a32fcfebbff9aba Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 1 Jun 2021 10:23:59 +0800
 Subject: [PATCH] drop FindPythonInstDir.cmake
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-utils-utils.cpp-fix-c=
ompilation-with-musl.patch b/meta/recipes-devtools/libdnf/libdnf/0001-utils=
-utils.cpp-fix-compilation-with-musl.patch
index 061e7dffbd..0a6744db9a 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-utils-utils.cpp-fix-compilat=
ion-with-musl.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-utils-utils.cpp-fix-compilat=
ion-with-musl.patch
@@ -1,4 +1,4 @@
-From 699608a4c03ebbf64c1d7b6f56d9811492175daa Mon Sep 17 00:00:00 2001
+From 899a524ff896d7c400e3b48f8c19feac695a7875 Mon Sep 17 00:00:00 2001
 From: Wang Mingyu <wangmy@fujitsu.com>
 Date: Mon, 17 Nov 2025 00:05:14 +0000
 Subject: [PATCH] utils/utils.cpp: fix compilation with musl
@@ -17,7 +17,7 @@ Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
  1 file changed, 3 insertions(+), 2 deletions(-)
=20
 diff --git a/libdnf/utils/utils.cpp b/libdnf/utils/utils.cpp
-index f5d200b8a..501bc0ed2 100644
+index f5d200b8..40866360 100644
 --- a/libdnf/utils/utils.cpp
 +++ b/libdnf/utils/utils.cpp
 @@ -9,6 +9,7 @@
@@ -46,6 +46,3 @@ index f5d200b8a..501bc0ed2 100644
      });
 =20
      return paths;
---=20
-2.43.0
-
diff --git a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables=
-with-pkg-config-cmake-s-own-mo.patch b/meta/recipes-devtools/libdnf/libdnf=
/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
index f55870802f..ff4db81d98 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-p=
kg-config-cmake-s-own-mo.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-p=
kg-config-cmake-s-own-mo.patch
@@ -1,4 +1,4 @@
-From a921a92f334a2a30741b906c206e041cef2d904d Mon Sep 17 00:00:00 2001
+From 514b377d6c37ede0db0e3947f2870b22c1f8cf4c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:24:50 +0200
 Subject: [PATCH] Set libsolv variables with pkg-config (cmake's own module
@@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
  1 file changed, 2 insertions(+), 1 deletion(-)
=20
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index c6bd46a6..a6f14318 100644
+index 63e69888..6c866111 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -51,7 +51,8 @@ endif()
+@@ -58,7 +58,8 @@ endif()
 =20
 =20
  # build dependencies
diff --git a/meta/recipes-devtools/libdnf/libdnf/armarch.patch b/meta/recip=
es-devtools/libdnf/libdnf/armarch.patch
index 8a36f87227..9080024bf5 100644
--- a/meta/recipes-devtools/libdnf/libdnf/armarch.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/armarch.patch
@@ -1,4 +1,4 @@
-From baf4fc9f157e4c08c67d1a577b0f1e10f213a642 Mon Sep 17 00:00:00 2001
+From ec69d285812fc442ee04fe37144e7de4fecd24f1 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 9 Nov 2023 10:29:31 +0000
 Subject: [PATCH] libdnf: Fix arm arch mapping issues for qemuarmv5
@@ -15,7 +15,7 @@ Upstream-Status: Inappropriate [Relies on OE rpm config]
  1 file changed, 23 deletions(-)
=20
 diff --git a/libdnf/hy-util.cpp b/libdnf/hy-util.cpp
-index 9978c8e9..aa1369b6 100644
+index 82f24edd..43cdea69 100644
 --- a/libdnf/hy-util.cpp
 +++ b/libdnf/hy-util.cpp
 @@ -117,29 +117,6 @@ hy_detect_arch(char **arch)
@@ -45,6 +45,6 @@ index 9978c8e9..aa1369b6 100644
 -    else if (!strcmp(un.machine, "mips64"))
 -        strcpy(un.machine, "mips64el");
 -#endif
-     *arch =3D g_strdup(un.machine);
-     return 0;
- }
+ #if defined(__e2k__)
+     if (__builtin_cpu_is("elbrus-v4") || __builtin_cpu_is("elbrus-8c") ||=
 __builtin_cpu_is("elbrus-1c+"))
+         strcpy(un.machine, "e2kv4");
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.75.0.bb b/meta/recipes-d=
evtools/libdnf/libdnf_0.76.0.bb
similarity index 92%
rename from meta/recipes-devtools/libdnf/libdnf_0.75.0.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.76.0.bb
index a757257abd..e8a2dca4d8 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.75.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.76.0.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Library providing simplified C and Python API =
to libsolv"
 HOMEPAGE =3D "https://github.com/rpm-software-management/libdnf"
 DESCRIPTION =3D "This library provides a high level package-manager. It's =
core library of dnf, PackageKit and rpm-ostree. It's replacement for deprec=
ated hawkey library which it contains inside and uses librepo under the hoo=
d."
 LICENSE =3D "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b364516=
c"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4bf661c1e3793e55c8d1051bc5e0ae2=
1"
=20
 SRC_URI =3D "git://github.com/rpm-software-management/libdnf;branch=3Ddnf-=
4-master;protocol=3Dhttps;tag=3D${PV} \
            file://0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-m=
o.patch \
@@ -13,7 +13,7 @@ SRC_URI =3D "git://github.com/rpm-software-management/lib=
dnf;branch=3Ddnf-4-master;p
            file://0001-utils-utils.cpp-fix-compilation-with-musl.patch \
            "
=20
-SRCREV =3D "d39573195e24b43687587a8d83b9f6ac274e2412"
+SRCREV =3D "56370b044f6efdfd14240e3dccac62b833dbe027"
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
=20
 DEPENDS =3D "glib-2.0 libsolv librepo rpm libmodulemd json-c swig-native u=
til-linux"

