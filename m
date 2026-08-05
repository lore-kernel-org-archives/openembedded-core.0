Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDBACC55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 16:26:13 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44130.1785947164247322747
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 09:26:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=E2V0lyN7;
 spf=pass (domain: est.tech, ip: 52.101.84.56, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZIePtsTnuNsNacf9lclvzI+3vnBSEQI4XUiTaLFHJLVEHgPvyTChpzfHJ/uEAltI+STOE+zbYhD33W3cN9vxoGpsydgt9wc+fhDLO0cBzZpVCruk0FYOVvwa4uGKW2qYpxJch4INcCtaz0f3wB7dcglPYB3a3OczoH2VyULdVw+JAuQ2uEYD4lBuM1cWk3Y0LYLg5PXpHrQIY+/feuxd7AhrZyQEds0D56FoZ+jJ/d3ZRGdmN2HnTFEqgwFaSLYVy1q3dsSbS5DQ75MCiKG4Q5aNfNxbB1O7FLQPZn3grLPPOy1pAIyNE3ZY6gBXVQZ213TkYlpx8jxUjNY7fEVog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ly4VZ3rFp4SJXI0keWaoD4kMoceUGMHzoQFIRvMJ16s=;
 b=h4hgx8BKtZAwPDoStvjNCoRdNz0BKXoVtKPztcT9hEngtCKEunkJ7j/F/L+96beJhPfuKPzEcJ5x2ODPFEeGB/ImmCjcXMnUScqE8GOUhr2PbN8MIJ2r/LC1iO9DeqSR3pB2IljrB9xGtylMWzhMbrYev4HzpxLL1xINjFK0wNbrfI0FD7MINwD6CbTZFazTI+Py4gw6bKvUtKWZejUPvB3EckR01xMb34UWnoBe5jGLMu/sVh5XCMjlGdgebLqrFxcAG9ad8ILa1ySJWu+mGH+duQg/UxjbXjP3dtxm518Z2xX7pQozXETWSq/qK7D5ggadibe0EBZBa5e1LwtKhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ly4VZ3rFp4SJXI0keWaoD4kMoceUGMHzoQFIRvMJ16s=;
 b=E2V0lyN7oFU2XcRowqskTgA5RDQr3eAP6Omc3BAMW3e889gYh6rc7wdMk4CzjnFUkAPj73araL9k9FtMA5aoubAid/RZAMXYj3suFCeDPJ+wJeWVIuDbgIJ4JHQMPZFfLm53Lha79bQRPsQmnXw3/CjXpIZ3shBmVVlqA0y4oQambNWAVcWyLESnX/lXIKpzFWNH4VEi3nFADxuY7Cq3tIQhOyM/FSBr2cNsEFlAk1vQ+c8jnv93FlMC2+PIiGBtwvTcZ7w84ViTepSzo/gnHkxs6qAa/oRQtHqr4XjIdsPnMYcet80ME8ElhtGQnXuA9tehAeJ75Xu46Fny1mpAGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM0P189MB0641.EURP189.PROD.OUTLOOK.COM (2603:10a6:208:1a2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.4; Wed, 5 Aug 2026
 16:25:59 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 16:25:58 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH] nfs-utils: upgrade 2.9.1 -> 2.9.2
Date: Wed,  5 Aug 2026 18:25:50 +0200
Message-ID: <20260805162550.13442-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0078.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::7) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM0P189MB0641:EE_
X-MS-Office365-Filtering-Correlation-Id: 05cff419-e2b4-41cd-fb56-08def30e3b7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|10070799003|23010399003|376014|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	JwH21lSuQ+vjRKb6Ws6v4jo9v7hTlVbHBYzcQbtrb0NKIIne2Mg6ciONPtlMD5BlEg0MQYnvR2flzgWqGe1IBthUJT0bKe1y1AuM95yxUjfY6zvPY5XAdcl/WzSEkFaF5UIUeDkD7Vc2lGNpryzM4wUZUj0SxvtrdsYd4QzAoUL9Dy8Y5C6C/C2sMZrcayl4byomQqETQjuocJBX2vSdUIZoLAROQaMzGqkUzrL2urwTe4yC86ZJWUby2DIP2OfaN6hSUnOulbpJbLldUAGK8phxrA5ddT6rCI6xvWdUGhQWR+p0uuyMYCeWMbauFZxMkF7hN+9Uj6A6B+HuHe1ST8VJscuLFaGWud3BquD7bX88qvRbSODvXATNh5VMAYHZdmSGce0QyR0KrsoR6aQDIdt9xtZTYLWZ1K4EKoT3be5O6Gqebl5OazCE+kwc9xWSiYUMaPOjHBzlTqtgVISJIh7RTJv9PddYD6IfyD9xU7/s+G6HuC+ONIJs2fcqXhtEJnMqZMmb6MlcUru7hjv5njubC4D4f+YPIl7VPBafW3V9ce30mlowbQX+Wqdh3ckQlq9RLmfWPaq0ihYhC/XfFv0f3I8+H1FFyzHWc5bAntnPf89cYnVhQSuap7hspWYB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JBgV6NGFgiiTpd/7dfR9SbsLQPYCqe7ZrKKRPSa0rxmuOTYYN3DZtZoah3RD?=
 =?us-ascii?Q?sRx/Q+MIwKbdBZLndFK06/Gp6nwKObCJ1z/dgWA8cntLFD8dm9GD4vapl7Tx?=
 =?us-ascii?Q?1xZuIi0Yt2KrSKxSiN182O4UbDai2gvfbKSW0Z0oOT2+Rji6hJSyrBjSeA8V?=
 =?us-ascii?Q?/2+bWdL3pHkJL+XP9puT/gPBLwHr1nVQUYI368vA2ucKclA3yY2bfCxaocm/?=
 =?us-ascii?Q?kfn7uxH7Cwbl7S0Fgte15uFWM8ynuh1uCg/lSLNFPGycoh72/EGzczodN0Z8?=
 =?us-ascii?Q?zCLQXgDIeA3Aq1rEq0YEqmmpi7KSRiH3wB9EQ7DjCv2gdhfwooj5xb8sZkME?=
 =?us-ascii?Q?wUsAEe7WkB6hGXzGsH1bpTnbqnA8HTuiMLbpMSF3zv7QwvIi2BRzUdlZEIzA?=
 =?us-ascii?Q?GQCDRsBvqU8VsQynqOF61VIJCys6p0cW6SFwvPBBJhZvC491Z5LWwM9vy268?=
 =?us-ascii?Q?L+VX/Jot2Ef7gp2hFR2EuFaa3hrOotejGFHsNXPnsRkqHvJUxEBZQxWwcEhR?=
 =?us-ascii?Q?EmegumaAYpvqCr40HSWZaRUlgJfiZ2IbmiVYE4yL+XQKvm/runxYb3InAzlS?=
 =?us-ascii?Q?F5uGu7Lw6ape5ji5+jw3nC8DLrqwy8R8/B5lUSjZOo0R5ElV7f6SHVVnxEap?=
 =?us-ascii?Q?nAuoHGNKXhd8jW+xK2QgezzvS5N2XPNfMwri8ZLVbQ15K5jarAYshwW/qJcL?=
 =?us-ascii?Q?xPy8ohasOU1V7l5R7fmAyrbZu+scav245L8zyNeQ9KvF4KZq3bB0YMi+NLCK?=
 =?us-ascii?Q?pdtAg+/6rHTzKnOK6eVnBXLF4U038VANANwym2o+YBBpjn24e8rATsu9lc5T?=
 =?us-ascii?Q?LquS5Etg+83j9Kcrqcxadc/HNMwuScpL1rPsnBGOivJaNwf5demIYlDgrMKo?=
 =?us-ascii?Q?zexIs6/HNKKd100jRrmZJjcla2uBuFUTFyLEeZvTFntAMxiMrvWeVm7zDrWq?=
 =?us-ascii?Q?/kD3RsY6oPImBw35uPKDELx5BeKFOEzc2PzTlHk3AxQqtPd/nPN3RbsT5Vwr?=
 =?us-ascii?Q?FEY1Fz6le9lXFbJDw4H3QdcbQ9UvKRRomjSa5pLdcCrrdi+sjvZ04WF/r2pK?=
 =?us-ascii?Q?V+NPTj0UD+DyjRodEpp/FQghVsQScZFpDkKFSzkTPBUe2XTDyfbUavPyuUNC?=
 =?us-ascii?Q?xXhIESo7rxJKDDKkGCbOFKo4I3AvKFtPbSnkNd0BTkfTgYwcB3dnoYCGrcmf?=
 =?us-ascii?Q?R6Of7M7HDLYk7dblmgIeZ9UrNGbmMv79hYy0ydDH+RPYqh2Hr2EEeTiyTShu?=
 =?us-ascii?Q?4hzsFtD/fbnkGeexYLK/F8k2M92hKdkCKmVzynNeL7/iqMMTyxhJLPkAwyAm?=
 =?us-ascii?Q?016ukyU13eFi6nQe2yKoBywt0puI/CYsh3DVy2bg+a4yV9+kT4BJSVR95PUY?=
 =?us-ascii?Q?fYdOhuxZRtXUPGl5HSwQw/0FvlfjdAGkY0Nl7EFKesdEJk6s0LHG88ayamMg?=
 =?us-ascii?Q?JWVX/+5Qg5Piqb3EOPD9PyJCxJgjdSTXjSTUZWPnnfj0vtpK7f9opWKtnqa+?=
 =?us-ascii?Q?Fx1gCbJ50v4Pn04vDgFRu9ex7qp/iiFhFaVfYeA+spzJYFv+6od7qDrXh05t?=
 =?us-ascii?Q?tPNL9LYS99qfjknJAfnLyCtdsdFMK174nJvBmPSlyAEIuzF/bbH0u8pnVFQB?=
 =?us-ascii?Q?YJ+WdH7x9GUyCX7bhhpow2+qCWMYeOnf7o03JKcIeoLOCedglyVVnmOPgtan?=
 =?us-ascii?Q?aupHniby4p8IqDUNblX/rkUGlwbLuLyaE1mSSJFl1XW/YcB06kUJIuXsG9eX?=
 =?us-ascii?Q?Wa7SJTzxIE1H9SmH2sZCdTK6lh0HKRbgPQHE30nN+XwLXRnlEnUJxEmt5Rk+?=
X-MS-Exchange-AntiSpam-MessageData-1: 7I/oKkY4tanBXH48iv6cXA1+N0+lJXU4Kjk=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 05cff419-e2b4-41cd-fb56-08def30e3b7c
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 16:25:58.7883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I3g+B/oTBdXC/QbahECPlatGRlYwz4LObw2icg4KQkveM5/BN4U9lNpkmoW/X8LSiHRHfZY9+9u9ZE1uXU9VIa2eBZCAME5SjejsnBs2kOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P189MB0641
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 16:26:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242879

ChangeLog: https://www.kernel.org/pub/linux/utils/nfs-utils/2.9.2/2.9.2-Cha=
ngelog

Add 0006-configure.ac-gate-HAVE_NFSD_NETLINK-on-enable-nfsdct.patch to
fix link failure when building with --disable-nfsdctl:

  ld: exportfs-exportfs.o: in function 'unexportfs_parsed':
  exportfs.c:491: undefined reference to 'nfsd_nl_cmd_str'

HAVE_NFSD_NETLINK is defined unconditionally in configure.ac, but the
implementation (nfsdnl.c) is only compiled under CONFIG_NFSDCTL. Move
the AC_DEFINE inside the enable_nfsdctl conditional so the feature
gating is consistent. Reported to linux-nfs@vger.kernel.org.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ..._key_file.c-Fix-build-error-for-musl.patch |  9 ++--
 .../0004-Use-nogroup-for-nobody-group.patch   |  6 +--
 .../0005-find-OE-provided-Kerberos.patch      |  4 +-
 ...e-HAVE_NFSD_NETLINK-on-enable-nfsdct.patch | 47 +++++++++++++++++++
 ...{nfs-utils_2.9.1.bb =3D> nfs-utils_2.9.2.bb} |  3 +-
 5 files changed, 57 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0006-conf=
igure.ac-gate-HAVE_NFSD_NETLINK-on-enable-nfsdct.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.9.1.bb =3D> nfs-ut=
ils_2.9.2.bb} (97%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-fh_key_file=
.c-Fix-build-error-for-musl.patch b/meta/recipes-connectivity/nfs-utils/nfs=
-utils/0001-fh_key_file.c-Fix-build-error-for-musl.patch
index d6db1fe0c0..d5843d5295 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-fh_key_file.c-Fix-=
build-error-for-musl.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-fh_key_file.c-Fix-=
build-error-for-musl.patch
@@ -1,4 +1,4 @@
-From 98048fd9262b3e4e024248ebd07d5ff66175e4ec Mon Sep 17 00:00:00 2001
+From 48eed3ed46893ce435cff271bbc58f243f9bc1cf Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Thu, 7 May 2026 03:32:57 -0700
 Subject: [PATCH] fh_key_file.c: Fix build error with musl
@@ -14,10 +14,10 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  1 file changed, 2 insertions(+)
=20
 diff --git a/support/nfs/fh_key_file.c b/support/nfs/fh_key_file.c
-index 5f5eafc..89555ce 100644
+index 81ea150..947abcb 100644
 --- a/support/nfs/fh_key_file.c
 +++ b/support/nfs/fh_key_file.c
-@@ -30,6 +30,8 @@
+@@ -31,6 +31,8 @@
 =20
  #include "nfslib.h"
 =20
@@ -26,6 +26,3 @@ index 5f5eafc..89555ce 100644
  #define HASH_BLOCKSIZE  256
  int hash_fh_key_file(const char *fh_key_file, uuid_t uuid)
  {
---=20
-2.49.0
-
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup=
-for-nobody-group.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/000=
4-Use-nogroup-for-nobody-group.patch
index bbf44d5977..7e63cb6282 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-no=
body-group.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-no=
body-group.patch
@@ -1,4 +1,4 @@
-From 001913c5eb0aad933a93ee966252905cd46d776b Mon Sep 17 00:00:00 2001
+From 5f4739475f3c01145174734ed8a3b31b3da99b77 Mon Sep 17 00:00:00 2001
 From: Daniel McGregor <daniel.mcgregor@vecima.com>
 Date: Tue, 6 Jun 2023 16:07:53 -0600
 Subject: [PATCH] Use "nogroup" for nobody group
@@ -11,7 +11,7 @@ Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.co=
m>
  2 files changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/support/nfsidmap/idmapd.conf b/support/nfsidmap/idmapd.conf
-index 2a2f79a1..e6f3724f 100644
+index 2a2f79a..e6f3724 100644
 --- a/support/nfsidmap/idmapd.conf
 +++ b/support/nfsidmap/idmapd.conf
 @@ -41,7 +41,7 @@
@@ -24,7 +24,7 @@ index 2a2f79a1..e6f3724f 100644
  [Translation]
 =20
 diff --git a/utils/idmapd/idmapd.c b/utils/idmapd/idmapd.c
-index cd9a965f..3be805e9 100644
+index 5231f56..e1aa8a5 100644
 --- a/utils/idmapd/idmapd.c
 +++ b/utils/idmapd/idmapd.c
 @@ -89,7 +89,7 @@
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-pro=
vided-Kerberos.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-f=
ind-OE-provided-Kerberos.patch
index 3241e8e859..bb152c2754 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-K=
erberos.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-K=
erberos.patch
@@ -1,4 +1,4 @@
-From a2af266f013722a64c5d04e0fe097cd711393a53 Mon Sep 17 00:00:00 2001
+From a1759d9079a436096be5ce44622a3a5a85ec9faa Mon Sep 17 00:00:00 2001
 From: Daniel McGregor <daniel.mcgregor@vecima.com>
 Date: Wed, 8 Nov 2023 16:24:20 -0600
 Subject: [PATCH] find OE provided Kerberos
@@ -10,7 +10,7 @@ Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.co=
m>
  1 file changed, 4 insertions(+), 2 deletions(-)
=20
 diff --git a/aclocal/kerberos5.m4 b/aclocal/kerberos5.m4
-index f96f0fd4..ad85fdf2 100644
+index f96f0fd..ad85fdf 100644
 --- a/aclocal/kerberos5.m4
 +++ b/aclocal/kerberos5.m4
 @@ -22,8 +22,8 @@ AC_DEFUN([AC_KERBEROS_V5],[
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0006-configure.a=
c-gate-HAVE_NFSD_NETLINK-on-enable-nfsdct.patch b/meta/recipes-connectivity=
/nfs-utils/nfs-utils/0006-configure.ac-gate-HAVE_NFSD_NETLINK-on-enable-nfs=
dct.patch
new file mode 100644
index 0000000000..d15ea1ac5d
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0006-configure.ac-gate-=
HAVE_NFSD_NETLINK-on-enable-nfsdct.patch
@@ -0,0 +1,47 @@
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Wed, 5 Aug 2026 06:55:00 +0000
+Subject: [PATCH] configure.ac: gate HAVE_NFSD_NETLINK on --enable-nfsdctl
+
+HAVE_NFSD_NETLINK is currently defined unconditionally, but the
+implementation of nfsd_nl_cmd_str() in support/nfs/nfsdnl.c is only
+compiled into libnfs when CONFIG_NFSDCTL is true (--enable-nfsdctl).
+
+This causes a link failure when building with --disable-nfsdctl:
+
+  ld: exportfs-exportfs.o: in function `unexportfs_parsed':
+  exportfs.c:491: undefined reference to `nfsd_nl_cmd_str'
+
+The callers (exportfs.c) guard their usage with #ifdef HAVE_NFSD_NETLINK,
+and nfsdnl.h provides a static inline stub returning -ENOSYS when the
+macro is not defined.  So the correct fix is to only define
+HAVE_NFSD_NETLINK when --enable-nfsdctl is in effect, keeping netlink
+support as an opt-in feature consistent with the CONFIG_NFSDCTL guard
+on nfsdnl.c.
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-nfs/9fec9f1b-1c1=
0-4a20-8282-dfc9addb4ee8@est.tech/T/#u]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+--- a/configure.ac
++++ b/configure.ac
+@@ -256,8 +256,6 @@
+ PKG_CHECK_MODULES(LIBNLGENL3, libnl-genl-3.0 >=3D 3.1)
+=20
+ AC_CHECK_HEADERS(linux/nfsd_netlink.h)
+-AC_DEFINE([HAVE_NFSD_NETLINK], 1,
+-	  [Define to 1 if nfsd generic netlink support is available])
+=20
+ # ensure the system netlink headers have the latest features
+ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#include <linux/nfsd_netlink.h>]],
+@@ -279,6 +277,8 @@
+ 	enable_nfsdctl=3D"yes")
+ 	AM_CONDITIONAL(CONFIG_NFSDCTL, [test "$enable_nfsdctl" =3D "yes" ])
+ 	if test "$enable_nfsdctl" =3D yes; then
++		AC_DEFINE([HAVE_NFSD_NETLINK], 1,
++			  [Define to 1 if nfsd generic netlink support is available])
+ 		PKG_CHECK_MODULES(LIBREADLINE, readline)
+ 	fi
+=20
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb b/meta/=
recipes-connectivity/nfs-utils/nfs-utils_2.9.2.bb
similarity index 97%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.2.bb
index 06e4fcb6e0..adcc606ad3 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.2.bb
@@ -24,9 +24,10 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/nfs-utils/$=
{PV}/nfs-utils-${PV}.tar.x
            file://0004-Use-nogroup-for-nobody-group.patch \
            file://0005-find-OE-provided-Kerberos.patch \
            file://0001-fh_key_file.c-Fix-build-error-for-musl.patch \
+           file://0006-configure.ac-gate-HAVE_NFSD_NETLINK-on-enable-nfsdc=
t.patch \
            "
=20
-SRC_URI[sha256sum] =3D "302846343bf509f8f884c23bdbd0fe853b7f7cbb6572060a90=
82279d13b21a2c"
+SRC_URI[sha256sum] =3D "e1dd8a9c95af15492065942cc3b52b1339ffd586baa2280ed8=
6c9d3dc4097e8c"
=20
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nf=
sd module will
 # pull in the remainder of the dependencies.

