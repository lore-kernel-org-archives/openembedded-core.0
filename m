Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1928AC982D7
	for <webhook@archiver.kernel.org>; Sat, 19 Sep 2026 14:10:09 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13004.1789827004371429545
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Sep 2026 07:10:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=R9WGFrFZ;
 spf=pass (domain: est.tech, ip: 40.107.130.32, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6WKxuj0FoTMHFl6zFLPKSBX/2SsUftOcVESz0qxUAmS5dOHy9Yh5F9TkLWGnOgfUOP2mtB4miaaA/JFy0ZN9Zc4U7x9OE7LhUCq77SuaceS+6MQ4q6Ey9KvyuaKpiRPYQR4hwgz1HB/IDjMv95ONjU6sXEC9OW5SmTxPtaYNLimFCeWXAJXqj3cA+jChP7FZtaMQQj+qisahKc94kSKlJZ3oI3tXKK+YVxJ27Yx6Roor11ljNyo8FwMd41vK9pwBO4+hYc6Nog+xR29pRt6BbRxl5iUlAia+3oOc/vo6rW+ngqhJYKCBJzKKu0GR2/3D/BUwIDpMJGqbHGbUR7nlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itOmxuX/5PNYY4tiwiUTgl5SNQC10Qwpzv9+Ybp0LXg=;
 b=aPfVmWbyjmSqkbbbo3lEA9f9lLb2EvDQf8ShqbbVXSCPGLtE91Ws3fWKKdx34YCgrT2PqsyfwrTu/908lYWYX2kIiwNZqUW6d6tMl91dwxi1iPfVDLXSdPbZ/L+l1Bwwijs+Z4zN2JrUIeLAKVgqgYD3TvFflz0yWXebTC05ib1iFpCAbm+PnP/1MMrq0Rvw/RnTCpVgpU5g1yrTnCvNGqdJ9C8IrhWAKhSwT5GsjcJkg0+7aM2WZOSNFJRZFplpP7O4/g/oMrLZRbpHucnrjcTeWvhanABFSSogthGYJwSxzq2hTq4fBsvGg9Ma6dnqoQAbsUQ27OdiB732eqO4KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itOmxuX/5PNYY4tiwiUTgl5SNQC10Qwpzv9+Ybp0LXg=;
 b=R9WGFrFZT4XJAFdF5GxUAKAhBN5pnBw8lz6f08BAGy73u8In36V7dDWCW6rgvPomZ9vBPr4MIXXdr73U4IgQhtnN0dg1HhVl0LdyuT2h2JBQJ6eq5WNeuZEEwgKdoIEQDPXYXLX0/ajkc11qXkIl/pd+gklVTWh0xb1Enhv+vWF8mcvGmg2BeH/Ynowl1rDawcwqCrRCzSddb6Ue+2GySdekUMLCna6c5KlXJZkvYelcGiBD6w5pOxni6ZE7cFbW5f11/2q8TJQ7vCWvLZ2NjMghCRYfGM0BhTsBXB5tTaxbEV7rZj6BVGlWQdiG+PANZiOexj1ft8NiiCZrEpZ2tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA4P189MB1215.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:bb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.15; Sat, 19 Sep
 2026 14:09:59 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0428.011; Sat, 19 Sep 2026
 14:09:59 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemtap: Upgrade 5.5 -> 5.6
Date: Sat, 19 Sep 2026 16:09:57 +0200
Message-ID: <20260919140957.80166-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0333.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::14) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA4P189MB1215:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e6d1ba6-c63b-4261-f55a-08df1657b0ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|6133799003|18002099003|10067099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	FCaT4mYmk6TkFwLD59Rr8ipFWb7hTXoMliQ9pB/kny2LEvGbullxomfUYl3cM5BgQ5xY2FqLaGeiOKkoOFvfoRhhtmty2HFMxg6NJN/JdLDz8BHr58vguD4vPlaD6ZFLLfH+duPH3VvyyKsb8UBkIxggGdJHZHWN/OKfXO+QoBVKLbcrI8bO8JTdzatgty8uVHPqrkin2F+N5fFes426OH51YsqZgpaL5Axy5zuV+WrSTa0o/3saXrJun5p9gjRhhFeUSe6DV7IOJ8YZQ5aRvnJV25F4NXbPfmA6qW4zc/vncvWPPa/tmbwvaVNW3J8xAeTduyo/WuUQfiiDd4fLRU0HxNji6yM//RFC4kGpEA03znGANWBvZu31Z3QGjmigY6MLxaPrK4QlhN9bv0qLqMqVq2fX1HWVzGqnzR/4TfZwm4byR6eQVQtuu0jZztavYt2dfl2giRdFsY9cys+XhLyq/sEF1f/A513LouY7R/Y4ODDaT1hXJ1StT0w5F1uJMrp/JOK3YWiIvovgeHQHgcEX+p+cn8rVxI8xuH60faeBXa98Mf/xJccXBV/PwQ5Cvgj9bPjrg4Rd3/ZJu6LFntjcyNeAGRO1KSGrYt8sp0k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(18002099003)(10067099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UWRn3GBhJFFZq60WNT0C6f5CG5X87KKuSgP7bShon2KsP8a7794ssm0jtix6?=
 =?us-ascii?Q?i5Krjk1ZwXlaKcVuFKhC3EywsdL8oo6FGSZkJarY2sJJtoa34oWCEuxGDTqP?=
 =?us-ascii?Q?sl6ZYHpaAM6zw0foXq4Rm56Npmwg4DnYZjl7VjvgAyMGISREAztTSg5w2YVA?=
 =?us-ascii?Q?QsBRhsGKLpa6bxfTLZy5uTdfN+dcilBXlqj3BpIURN80BncTBSYZlmOnyACC?=
 =?us-ascii?Q?S1blGiO0TeJZ5PP1io/Vuo4vXV64OODWPREafagG8gIebdO3qo0HgnG8vGKG?=
 =?us-ascii?Q?EclFKTY2wmsNBidvJ+J4sjrJ8wiAGC+Pox/UKTOSXxK6w/AMNyfr2bmt1lU9?=
 =?us-ascii?Q?HyvsxjqLPWBm/L5xDOWqrcVrC7vZFDyx/v5elqjW2VVZwZ4dqZmqtlJ3A8u1?=
 =?us-ascii?Q?ZobZb9CNUpQq6A7k/33Ve3nvo2jvlOXM49grOXJoLrc/2AGoqq18X//1JTg7?=
 =?us-ascii?Q?hAU7GMmR5/QCOWjk52bCmt0juMXt1Oy1hwPR2eup0pazxP1qS1cN0za3vXSu?=
 =?us-ascii?Q?C515tGTqrRs3gTa6h5XxzgCKO4ieA7L6WI9v8NMjJ3yOtGwaM24ooXEB+Q2o?=
 =?us-ascii?Q?lKHdYuHdQzPn62FN3a+dKsB3jpynRf4DEdDiB9i1+amz8nVSyTXPkzz5KKtH?=
 =?us-ascii?Q?wH5VjpzCWbkEcrDZI0q0OiacQ3cQVKB9TaYd673qsJ1SsOhb7XzfvD0E+w6x?=
 =?us-ascii?Q?PFdhFiU0xHmsA/AHlaVBkedLaHrF5OodfqtcTEoLet9GJdgtOXRa3eJu3jGp?=
 =?us-ascii?Q?jDmU87KJnK1D++bV1Sn9xnTS9YaiIMlZ/4H6NUDIRr9XNduE0zyanYeEki9+?=
 =?us-ascii?Q?pbZgVgkVSEMjLfxXUb5+PMSbKFqZQEU8RkkFCY51pANmjszle+fvt6sweGAn?=
 =?us-ascii?Q?Ik2uw9A+DBmbGH/uI1Un87rziILTdlYm9aKVpT9yA6jfojKkpDjTyhWf+wDt?=
 =?us-ascii?Q?jKSH7g0A3RzlYXh/btpqwipl7u4YlYuxkQocOjDvDVSh9SzFVvD8ngEZlR+p?=
 =?us-ascii?Q?LOmY/maSD5B/pPQ3ZyLOaWQujtEzsU72vQXsuOYqDk6mG773Wl+grzL6RmQZ?=
 =?us-ascii?Q?s4xlDXZi1jCQpr+vyqE5+4VisAqUB7QUzOQDlhXXKC7ftbPOtxN3Rm6lxgBg?=
 =?us-ascii?Q?OKdVc+OMi30+GI5sgDK8pfBKXEYP1ufuEG/xMFGemo347XdboRcZJtRThFae?=
 =?us-ascii?Q?cmqy9B+j+16DfmCUI1QyMqU9jhn90eylE72ER+4S5nZQ1/7ixaggwgwriwVT?=
 =?us-ascii?Q?vOGEbR6MFAUqC/G2GHaA5TrY6XSNLZGkx9yENCGAAHX5a6h7qjox06EyWxTK?=
 =?us-ascii?Q?gLXc+SLB/tH+52Vhe3oZCIO4yzuZN490pbJBoEsxyo8DH3Yscy78o34sIoA/?=
 =?us-ascii?Q?CrsRDdm+73Aji+W8qviU3svXqBUV20nlrW2yTy7QaXKdqkDeNiOYZTtriHcQ?=
 =?us-ascii?Q?fJCNvqSOBUUyxGJts48b7640+MJmp934/gCV6Ko3T6WiO/93Zkv3iJtg6ZTX?=
 =?us-ascii?Q?NQQ26Dbdys/NVMbkZOr6MYz+bBDdmkwVEpwvE2tQ+g1rcQyuIBx3YH79+zcf?=
 =?us-ascii?Q?pEGQQLJ+/oX57LtxCn2GfVDIx98hNeFxe/kLq4lnlXTxoxXvLxICE0VTeepO?=
 =?us-ascii?Q?yAX1jJnEVrvBZBlzp6IXaC9vDwwdH4cPpKan8AAG9W7I1shvE16qzWXiCmHR?=
 =?us-ascii?Q?JaH0mUpbke3zrEx0cvUFD3UHb5qeERdbwAv/+3qbgfWiA5fMZoqOCjgg5X35?=
 =?us-ascii?Q?z0u6Q9HxjyG4ZESon40NLmvbxUpQZCc=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e6d1ba6-c63b-4261-f55a-08df1657b0ae
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2026 14:09:59.3932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iCs6febXac+UPY+81bc3i0Dvj0X/BTaoV0RmKpBmznncXUAplx9DEHrCg9tPXSPEeP4XMrL+fcYSGoxn4vpclFvcX8AOXOrU/FGZ6oZ1sS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P189MB1215
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 14:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246236

NEWS: https://sourceware.org/git/?p=3Dsystemtap.git;a=3Dblob;f=3DNEWS;hb=3D=
release-5.6

- Clean up python2 support in recipe and clean up obsoloute patch
  More details [1], [2]

- Added pip/wheel native to the python3-probes PACKAGECONFIG =E2=80=94 the =
new build uses pip/wheel

- Added two patches to keep do_package_qa passing. The generated
  tapset/python3.stpm recorded the recipe-sysroot path of libpython,
  since it comes from sysconfig's LIBDIR and python3targetconfig points
  that at ${STAGING_LIBDIR}; @cast module names are resolved verbatim
  with no --sysroot translation, so that path also made python3 probes
  unresolvable on the target. The pip-installed HelperSDT module shipped
  __pycache__/*.pyc naming ${D} and a dist-info/direct_url.json naming
  the wheel in ${B}, both artifacts of "pip install --root".
  Reported upstream as PR34652 [3], patches posted to the systemtap
  list [4].

[1] https://sourceware.org/git/?p=3Dsystemtap.git;a=3Dcommit;h=3D3c9c8a8163=
e0a9c77bf9a3a7f87ceaf2d3de98b5
[2] https://sourceware.org/git/?p=3Dsystemtap.git;a=3Dcommit;h=3D55a0168613=
e765f6be5257b0c4fb97678292716f
[3] https://sourceware.org/bugzilla/show_bug.cgi?id=3D34652
[4] https://inbox.sourceware.org/systemtap/20260919135744.78642-1-jaipaul.c=
heernam@est.tech/

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...-native_5.5.bb =3D> systemtap-native_5.6.bb} |  0
 ...gure-write-a-python-location-into-th.patch |  2 +-
 ...ython-modules-to-correct-library-dir.patch | 53 -----------------
 ...rove-reproducibility-for-c-compiling.patch |  2 +-
 ...-record-the-installed-libpython-path.patch | 58 +++++++++++++++++++
 ...staprun-address-ncurses-6.3-failures.patch |  2 +-
 ...-don-t-support-installing-a-non-root.patch |  6 +-
 ...t-install-build-paths-with-the-wheel.patch | 49 ++++++++++++++++
 .../systemtap/systemtap/readline.patch        |  6 +-
 .../{systemtap_5.5.bb =3D> systemtap_5.6.bb}    |  6 +-
 .../systemtap/systemtap_git.inc               |  3 +-
 11 files changed, 121 insertions(+), 66 deletions(-)
 rename meta/recipes-kernel/systemtap/{systemtap-native_5.5.bb =3D> systemt=
ap-native_5.6.bb} (100%)
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-Install-py=
thon-modules-to-correct-library-dir.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-python3.st=
pm-record-the-installed-libpython-path.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0002-python-don=
-t-install-build-paths-with-the-wheel.patch
 rename meta/recipes-kernel/systemtap/{systemtap_5.5.bb =3D> systemtap_5.6.=
bb} (94%)

diff --git a/meta/recipes-kernel/systemtap/systemtap-native_5.5.bb b/meta/r=
ecipes-kernel/systemtap/systemtap-native_5.6.bb
similarity index 100%
rename from meta/recipes-kernel/systemtap/systemtap-native_5.5.bb
rename to meta/recipes-kernel/systemtap/systemtap-native_5.6.bb
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-Do-not-let-config=
ure-write-a-python-location-into-th.patch b/meta/recipes-kernel/systemtap/s=
ystemtap/0001-Do-not-let-configure-write-a-python-location-into-th.patch
index 8a6cc4e0a4..392950631e 100644
--- a/meta/recipes-kernel/systemtap/systemtap/0001-Do-not-let-configure-wri=
te-a-python-location-into-th.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-Do-not-let-configure-wri=
te-a-python-location-into-th.patch
@@ -1,4 +1,4 @@
-From adf505ededdd25cf43111fd12a59090a8f7de856 Mon Sep 17 00:00:00 2001
+From cba033a67d6d977cb5fa3862c4d3daa2eede08ba Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 22 Feb 2017 13:37:33 +0200
 Subject: [PATCH] Do not let configure write a python location into the dtr=
ace
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-Install-python-mo=
dules-to-correct-library-dir.patch b/meta/recipes-kernel/systemtap/systemta=
p/0001-Install-python-modules-to-correct-library-dir.patch
deleted file mode 100644
index 6a3fa04bea..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-Install-python-modules-t=
o-correct-library-dir.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From a261ee9efca120b6d65310a972d91dffc00ac937 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 24 Feb 2017 17:53:02 +0200
-Subject: [PATCH] Install python modules to correct library dir.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
-Add OE's CFLAGS which contains `-fdebug-prefix-map' options to
-setup.py
-
-Supply "--root" directory to the "install" command, and use
-it as a prefix to strip off the purported filename encoded
-in bytecode files. (It strips build path prefix from .pyc files)
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- python/Makefile.am | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/python/Makefile.am b/python/Makefile.am
-index 845db3661..130e90b24 100644
---- a/python/Makefile.am
-+++ b/python/Makefile.am
-@@ -8,6 +8,10 @@ AUTOMAKE_OPTIONS =3D subdir-objects
- AM_CPPFLAGS =3D -I$(abs_srcdir)/../includes
- AM_CPPFLAGS +=3D -I$(abs_builddir)/../includes/sys
-=20
-+# Add OE's CFLAGS which contains `-fdebug-prefix-map' options to
-+# fix build path issue
-+AM_CPPFLAGS +=3D $(CFLAGS)
-+
- # Any script in the following variable will get byte-compiled at
- # install time.
- pkglibexecpython_PYTHON =3D
-@@ -47,7 +51,7 @@ install-exec-local:
- if HAVE_PYTHON2_PROBES
- 	(cd $(srcdir); CFLAGS=3D"$(CFLAGS) $(AM_CPPFLAGS)" $(PYTHON) setup.py bu=
ild \
-          --build-base $(shell readlink -f $(builddir))/py2build \
--	 install --prefix $(DESTDIR)$(prefix) \
-+	 install --root $(DESTDIR) --prefix $(prefix) --prefix $(prefix) --insta=
ll-lib=3D${pythondir} \
- 	 --single-version-externally-managed \
- 	 --record $(shell readlink -f $(builddir))/py2build/install_files.txt \
-          --verbose)
-@@ -55,7 +59,7 @@ endif
- if HAVE_PYTHON3_PROBES
- 	(cd $(srcdir); CFLAGS=3D"$(CFLAGS) $(AM_CPPFLAGS)" $(PYTHON3) setup.py b=
uild \
-          --build-base $(shell readlink -f $(builddir))/py3build \
--	 install --prefix $(DESTDIR)$(prefix) \
-+	 install --root $(DESTDIR) --prefix $(prefix) --install-lib=3D${python3d=
ir} \
- 	 --single-version-externally-managed \
- 	 --record $(shell readlink -f $(builddir))/py3build/install_files.txt \
-          --verbose)
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-improve-reproduci=
bility-for-c-compiling.patch b/meta/recipes-kernel/systemtap/systemtap/0001=
-improve-reproducibility-for-c-compiling.patch
index 894cd3b407..970079ebcf 100644
--- a/meta/recipes-kernel/systemtap/systemtap/0001-improve-reproducibility-=
for-c-compiling.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-improve-reproducibility-=
for-c-compiling.patch
@@ -1,4 +1,4 @@
-From 06522edad080caa76f5abc8586fe5baf3b620f16 Mon Sep 17 00:00:00 2001
+From e39dbf74b501632bc3e9761eb95894dc1c6b2d86 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 18 Jul 2018 16:58:33 +0800
 Subject: [PATCH] improve reproducibility for c++ compiling
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-python3.stpm-reco=
rd-the-installed-libpython-path.patch b/meta/recipes-kernel/systemtap/syste=
mtap/0001-python3.stpm-record-the-installed-libpython-path.patch
new file mode 100644
index 0000000000..93efec941b
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-python3.stpm-record-the-=
installed-libpython-path.patch
@@ -0,0 +1,58 @@
+From 0387b9416ad7c25d71685441e1046f1c72cb1d42 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Sat, 19 Sep 2026 13:12:44 +0000
+Subject: [PATCH 1/2] python3.stpm: record the installed libpython path
+
+tapset/python3.stpm is generated at build time and installed, and its
+stap_python3_libpython macro is the module argument of the @cast()s in
+tapset/python3.stp:
+
+    @cast(@object, "PyFrameObject", @stap_python3_libpython)
+
+@cast module names are taken literally -- dwarf_cast_expanding_visitor
+resolves them with find_executable(module, "", sess.sysenv), i.e. with no
+sysroot translation -- so the macro has to name libpython as it exists on
+the machine stap is tracing.
+
+configure instead derives it from sysconfig's LIBDIR for the interpreter
+that built HelperSDT.  When cross compiling that is a directory in the
+build host's staging area, which exists on no machine but the builder, so
+every python3 probe on the installed system fails to resolve
+PyFrameObject.  The installed file also ends up carrying a build
+directory, which distro QA checks reject (OpenEmbedded's buildpaths test
+flags it as a packaging error).
+
+Keep only the library soname from sysconfig and anchor it at the $(libdir)
+being installed into, so the macro names the installed library.  For a
+native build where the interpreter's LIBDIR is $(libdir) -- the usual case
+-- the generated value is unchanged.
+
+Upstream-Status: Submitted [https://inbox.sourceware.org/systemtap/2026091=
9135744.78642-2-jaipaul.cheernam@est.tech/]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ Makefile.am | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 1f668df..4d255dd 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -140,9 +140,17 @@ $(TAPSET_PYTHON3_STP): $(srcdir)/$(TAPSET_PYTHON3_CAN=
DIDATE)
+ 	mkdir -p tapset # create build-tree tapset/ dir if needed
+ 	cp $< $@
+=20
++# The libpython path baked into python3.stpm is resolved at run time on t=
he
++# machine being probed, so it has to be the installed location.  configur=
e
++# gets PYTHON3_LIBPYTHON from sysconfig, whose LIBDIR points at the pytho=
n
++# build/staging area; when cross compiling that is a build host directory
++# which does not exist on the target.  Keep only the library soname from
++# sysconfig and anchor it at the $(libdir) we are installing against.
++PYTHON3_LIBPYTHON_INSTALLED =3D $(libdir)/$(notdir $(PYTHON3_LIBPYTHON))
++
+ $(TAPSET_PYTHON3_STPM):
+ 	mkdir -p tapset # create build-tree tapset/ dir if needed
+-	@echo '@define stap_python3_libpython %("$(PYTHON3_LIBPYTHON)" %)' > $@
++	@echo '@define stap_python3_libpython %("$(PYTHON3_LIBPYTHON_INSTALLED)"=
 %)' > $@
+=20
+ install: all
+ 	$(MAKE) $(AM_MAKEFLAGS) install-recursive
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-staprun-address-n=
curses-6.3-failures.patch b/meta/recipes-kernel/systemtap/systemtap/0001-st=
aprun-address-ncurses-6.3-failures.patch
index 59c0e8a7fd..e58053c864 100644
--- a/meta/recipes-kernel/systemtap/systemtap/0001-staprun-address-ncurses-=
6.3-failures.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-staprun-address-ncurses-=
6.3-failures.patch
@@ -1,4 +1,4 @@
-From 7672d0e398b29a52f59a1a0cbb75d4d07bd5f975 Mon Sep 17 00:00:00 2001
+From 949a5670611b67f070c58423c9f88b8837aaf443 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 25 Oct 2021 17:59:24 +0200
 Subject: [PATCH] staprun: address ncurses 6.3 failures
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-staprun-stapbpf-d=
on-t-support-installing-a-non-root.patch b/meta/recipes-kernel/systemtap/sy=
stemtap/0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch
index 8273e34b57..7bf723d5d3 100644
--- a/meta/recipes-kernel/systemtap/systemtap/0001-staprun-stapbpf-don-t-su=
pport-installing-a-non-root.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-staprun-stapbpf-don-t-su=
pport-installing-a-non-root.patch
@@ -1,4 +1,4 @@
-From 3483d0bc400eb618add607097027eafb075722f4 Mon Sep 17 00:00:00 2001
+From f0150581619d331522a7f26fb24b445c4f305fa0 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Tue, 5 Sep 2017 16:02:55 -0700
 Subject: [PATCH] staprun/stapbpf: don't support installing a non-root
@@ -14,10 +14,10 @@ Signed-off-by: Saul Wold <sgw@linux.intel.com>
  1 file changed, 6 insertions(+), 6 deletions(-)
=20
 diff --git a/stapbpf/Makefile.am b/stapbpf/Makefile.am
-index 4bd116bc3..e06d0801b 100644
+index 962b2dbec..ac24b7997 100644
 --- a/stapbpf/Makefile.am
 +++ b/stapbpf/Makefile.am
-@@ -40,10 +40,10 @@ git_version.stamp ../git_version.h:
+@@ -56,10 +56,10 @@ git_version.stamp ../git_version.h:
 =20
  # Why the "id -u" condition?  This way, an unprivileged user can run
  # make install, and have "sudo stap ...." or "sudo stapbpf ...." work lat=
er.
diff --git a/meta/recipes-kernel/systemtap/systemtap/0002-python-don-t-inst=
all-build-paths-with-the-wheel.patch b/meta/recipes-kernel/systemtap/system=
tap/0002-python-don-t-install-build-paths-with-the-wheel.patch
new file mode 100644
index 0000000000..fcc64dfe44
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0002-python-don-t-install-bui=
ld-paths-with-the-wheel.patch
@@ -0,0 +1,49 @@
+From bdd46549b9065aafd06fb01743d21c41b27bfc05 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Sat, 19 Sep 2026 13:12:44 +0000
+Subject: [PATCH 2/2] python: don't install build paths with the wheel
+
+pip byte-compiles the module it installs using the paths it writes to, so
+with DESTDIR set every .pyc in HelperSDT/__pycache__ records a
+$(DESTDIR)-prefixed source file name, and PEP 610 direct_url.json records
+the file:// URL of the wheel in the build tree.  Neither names anything
+that exists on the installed system, and both make the install
+unreproducible; distro QA checks reject them (OpenEmbedded's buildpaths
+test fails the build on all four files).
+
+Pass --no-compile, so the bytecode is generated on first import in the
+right place, and delete direct_url.json after installing.
+
+Upstream-Status: Submitted [https://inbox.sourceware.org/systemtap/2026091=
9135744.78642-3-jaipaul.cheernam@est.tech/]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ python/Makefile.am | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/python/Makefile.am b/python/Makefile.am
+index 0cb608d..1eaef4a 100644
+--- a/python/Makefile.am
++++ b/python/Makefile.am
+@@ -36,12 +36,21 @@ endif
+=20
+=20
+ # Note that we're installing from the wheel we just built.
++#
++# --no-compile: pip byte-compiles with the paths it writes to, so with
++# DESTDIR set the .pyc files record $(DESTDIR)-prefixed source names, whi=
ch
++# are wrong on the installed system (and defeat reproducible builds).  Th=
e
++# bytecode is regenerated on first import instead.
++#
++# PEP 610 direct_url.json records the file:// URL of the wheel in the bui=
ld
++# tree, which is likewise meaningless once installed, so drop it.
+ install-exec-local:
+ if HAVE_PYTHON3_PROBES
+ 	$(PYTHON3) -m pip install $(shell readlink -f $(builddir))/py3build/*.wh=
l \
+ 		 $(if $(DESTDIR),--root $(DESTDIR)) --prefix $(prefix) \
+-		 --no-deps --no-index --no-build-isolation \
++		 --no-deps --no-index --no-build-isolation --no-compile \
+ 		 --ignore-installed --verbose
++	rm -f $(DESTDIR)$(python3dir)/*.dist-info/direct_url.json
+ endif
+=20
+ clean-local:
diff --git a/meta/recipes-kernel/systemtap/systemtap/readline.patch b/meta/=
recipes-kernel/systemtap/systemtap/readline.patch
index f452188179..f59f5bcb7f 100644
--- a/meta/recipes-kernel/systemtap/systemtap/readline.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/readline.patch
@@ -1,4 +1,4 @@
-From ee20cb1c1ca0337c56087934efbd66ba30d2d5c3 Mon Sep 17 00:00:00 2001
+From 6bd6439042b9fc1155568e8a476257925424b7cb Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 13 Apr 2026 11:28:39 +0100
 Subject: [PATCH] configure: add option to enable/disable readline
@@ -18,10 +18,10 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 38 insertions(+), 29 deletions(-)
=20
 diff --git a/configure.ac b/configure.ac
-index 6fb99da40..2ec72e85a 100644
+index 5bfc86f92..c1835ea51 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -525,38 +525,47 @@ AC_CHECK_HEADERS([rpm/rpmcrypto.h], [
+@@ -526,38 +526,47 @@ AC_CHECK_HEADERS([rpm/rpmcrypto.h], [
                        have_rpmcrypto_h=3Dyes
  		      AC_MSG_NOTICE([separate rpm/rpmcrypto.h])])
 =20
diff --git a/meta/recipes-kernel/systemtap/systemtap_5.5.bb b/meta/recipes-=
kernel/systemtap/systemtap_5.6.bb
similarity index 94%
rename from meta/recipes-kernel/systemtap/systemtap_5.5.bb
rename to meta/recipes-kernel/systemtap/systemtap_5.6.bb
index 980c09d049..f0b14ef90a 100644
--- a/meta/recipes-kernel/systemtap/systemtap_5.5.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_5.6.bb
@@ -9,6 +9,8 @@ require systemtap_git.inc
 SRC_URI +=3D " \
            file://0001-improve-reproducibility-for-c-compiling.patch \
            file://0001-staprun-address-ncurses-6.3-failures.patch \
+           file://0001-python3.stpm-record-the-installed-libpython-path.pa=
tch \
+           file://0002-python-don-t-install-build-paths-with-the-wheel.pat=
ch \
            "
=20
 DEPENDS =3D "elfutils"
@@ -16,7 +18,7 @@ DEPENDS =3D "elfutils"
 EXTRA_OECONF +=3D "--with-libelf=3D${STAGING_DIR_TARGET} --without-rpm \
             --without-nss --without-avahi --without-dyninst \
             --disable-server --disable-grapher --enable-prologues \
-            --with-python3 --without-python2-probes \
+            --with-python3 \
             --with-extra-version=3D"oe" \
             ac_cv_prog_have_javac=3Dno \
             ac_cv_prog_have_jar=3Dno "
@@ -30,7 +32,7 @@ PACKAGECONFIG[translator] =3D "--enable-translator,--disa=
ble-translator,boost,bash
 PACKAGECONFIG[libvirt] =3D "--enable-libvirt,--disable-libvirt,libvirt"
 PACKAGECONFIG[sqlite] =3D "--enable-sqlite,--disable-sqlite,sqlite3"
 PACKAGECONFIG[monitor] =3D "--enable-monitor,--disable-monitor,ncurses jso=
n-c"
-PACKAGECONFIG[python3-probes] =3D "--with-python3-probes,--without-python3=
-probes,python3-setuptools-native"
+PACKAGECONFIG[python3-probes] =3D "--with-python3-probes,--without-python3=
-probes,python3-setuptools-native python3-pip-native python3-wheel-native"
 PACKAGECONFIG[debuginfod] =3D "--with-debuginfod, --without-debuginfod"
 PACKAGECONFIG[readline] =3D "--with-readline,--without-readline,readline"
=20
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes=
-kernel/systemtap/systemtap_git.inc
index 7845905d10..9a12050e00 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -3,12 +3,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
=20
 SRC_URI =3D "git://sourceware.org/git/systemtap.git;protocol=3Dhttps;branc=
h=3Dmaster;tag=3Drelease-${PV} \
            file://0001-Do-not-let-configure-write-a-python-location-into-t=
h.patch \
-           file://0001-Install-python-modules-to-correct-library-dir.patch=
 \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root=
.patch \
            file://readline.patch \
            "
=20
-SRCREV =3D "90b164cf106ef16f873ab58c8c6f653718bb6e17"
+SRCREV =3D "211e84349504077f0c84f759601b02f946465d29"
=20
 COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips|ri=
scv64|riscv32).*-linux'
 COMPATIBLE_HOST:libc-musl =3D 'null'

