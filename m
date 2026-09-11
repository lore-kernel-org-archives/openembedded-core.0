Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5620C88E53
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 08:51:33 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35180.1789116684266431753
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 01:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=j6tl4jP1;
 spf=pass (domain: est.tech, ip: 52.101.70.69, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XEAlvQJPwInTv4MDPFYULaO9wHg1jaFcu8nMC/YTG18dHexd4I1NeZICKW6kJUx92g4L+f+EBqebR59mN0RirNvld2EHOG1CHZc6oMP9fD+NyBUrBHEoyz6/H6cE0Ce8ti20NtLwPdD6der03MbfswhrH1z7FlyZKdTK4sVXPZGnL1YgQwvl1hPvw7BGi42nWyaLSk+SZaeoNq72bzYn5RR81KwK23HXyo8fSKJ+bm/5ZSW40B+51SNLk1qfV9o8MgzCuZL1aYkhObshZGv8afQnYsxATQE3lMl/mz8tBpYdn9AucMiNzijxWGhMo1VwGixxAmu8Q5ntMUjkZwNTaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cFpZGXTFZe5TclOsBrP3jNWAR6GX7DG46IQ05bKxlk=;
 b=eYWlcnfdrRGA+H8dfpoyIc0plHCMfpiiGGes6/6e4Po/ZEMV5NoqwO8lFv00j0V953/67DmPylxwO3RpP1avQ8njOQHqqv8LpPGtLry6uVooWR1dVSrv8W0nvmK17W96O8uQDEFHs/gTGJQpLOhqnswWa8t+F1ubxvnnx4pnaIm8e/2wTJm5eLzuQH1kxx0hEvylA50pQCJX0ZDf18VIJxhfpA8Ox91SQPdiW/xWhupENUYE3l6PYF1I1BQrMSVKKhKxwTNEuWE+LPzebz2AbLbGES1E/Ar0LY+V9ZS7K0XFpTX+IuWwYG/OIS0Hp52BQfjt9YmPvYpZk00Z2Znvpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1cFpZGXTFZe5TclOsBrP3jNWAR6GX7DG46IQ05bKxlk=;
 b=j6tl4jP1Ta4xQb0BH+aA26Np4e9/PRHaPob3Edte5BiDTqqftkuM4Mfkmqt5FD8aHq4XwYfDKhwlHl6WDT+bbV8z2QCAosjnwxAHrczdbVsERoXv7R2exAQEtoelKH7jEz5PbGYFZCJUaEg9l+2oIIrgCmDThv3+aPwp5f/Ev++Ua1WHNxhNL7PCg1GzNfHdQA5TkrEjmLo2267zPqU+Ir8jgBGFAuIpxKs9PYeW3VtulNn3gsrxOFtWwBL2htZstGRD8Q84jajG/0Uku0mvV5N+QZXrv1F96Xvd79rf4VuXa2PpPDdxGe5PkNfeLvMPTD7S/vDl+y4CypY8Tftqag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by MMZP189MB736094.EURP189.PROD.OUTLOOK.COM (2603:10a6:190:51::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 08:51:20 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 08:51:20 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] libpwquality: import recipe from meta-oe
Date: Fri, 11 Sep 2026 10:51:16 +0200
Message-ID: <e1d67ecc9f9f0acf2c15207475576d8cb192ad01.1789116540.git.jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1789116540.git.jaipaul.cheernam@est.tech>
References: <cover.1789116540.git.jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZP191CA0014.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::18) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|MMZP189MB736094:EE_
X-MS-Office365-Filtering-Correlation-Id: f4112e92-ec79-490c-185a-08df0fe1d989
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|23010399003|3023799007|6133799003|10067099003|56012099006|11063799006|13003099007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	SMygF5OZXQCVBFxhZy2+K1ZozR1har+7ediNMmSdGmxYp+ATNhmZYreqzXsOzim6btRczmF/KDmlrv0mseMrGxtvQdk9LakrbrDimwMMbyrKlZkvk0l5s2w1SCapzRMgQdIN9Y3aHdx1DJOYGcoafxokmntVgJUi+VOoX5fWpONVWQzLrQijWlQXfWBUwNLNhyWvVbeEMZXYSdFaE1uqCtIKfPE2iNOQkEcByjj5wc75Dkbtq/2h/MGKxpnru1KCL8FtVRTB8omA3nD1JO1VZSzOwlPYkStQhALSdKZohJ5RbVPgb2gs2UzcW9E4MmMcf7OnDpnAdWQn7QabdIPuOMsF7CGQAG7hQcJM4DBObVJkDOJsKPkGvhphepGhn3NZvb8xSUVM0jHTKxhv2hjqPmWhTO+qRAJSvrtKAsm5pDft8wNSgfv1kFgVjredRLV2JasCH5TapMZNsCsQtQ8exKIQtICkL26MXgwa7OG2mp96Rjp+iixf9GAHhoVhJ02lmYW0wowhUHFYLIBiSzxfKSgHuLmVuR7Dpa1zpQP8FGsMd2zsPbJ6HFZvYZ0o3J+la31EmnNydRNQhXDYSVx0WzTw9hEv4KR8ZiwotRwy+JLGyvrlseg1qrOVZ4J/85s7DHVWkeCfcUMj/sChuvgRBzGh0Y41QmJsFFBl/8FG3yI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(23010399003)(3023799007)(6133799003)(10067099003)(56012099006)(11063799006)(13003099007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YI8+7U3Bx0sC5gj/+cQYGboGYwkKqJauHl1S3QSkm+B2wGHGHYDPJ7DdmHA3?=
 =?us-ascii?Q?YNW22VMl9ubpsQZ82Th9pzh9YxPNgm1uf7crrIMUZiYfXSoLefwA1lyyN579?=
 =?us-ascii?Q?ryekhhyCF8zbzhcHP/Z6h3XxCAX6mbcM7gVenzHwXrbVQa0yVID/D0MeCOJR?=
 =?us-ascii?Q?iV62L/spZdCDO9PRXO+oBUuZAMJA1uLuVJokgfPRxzWSI1WoeCE3cpmvGNVV?=
 =?us-ascii?Q?+/cF3HmTMXy9CcivN5B7azt65+3yJBrdL+P+kiYXw6D+bHUGispvAksSe1tp?=
 =?us-ascii?Q?OP6TZ1eVDlPn/cCUbKc9PJ29Bh9uvlUnoZoZ8/wUeZEke6EdXGw38gz5NSbe?=
 =?us-ascii?Q?tmksXxWtqxWiX8EGoNYA6MJG1ITeqWH1DJP2S6QM51pSAO7D7Yf3pL60MBq7?=
 =?us-ascii?Q?EjANt1+YTWNcA4US+wFwV49A7nrDsda9Op/5dr6Nddo8HyFLPDrNOg9ML8hV?=
 =?us-ascii?Q?FSP3YdqPRBypb4L/mdBffK7L9xdR6GR9ayKy4qi/IxMbY2v8BltdZL3uP1HW?=
 =?us-ascii?Q?nOmnyL+sstZSWZC6DIVZyQRjvq3ajleTOms1WonGNHxMNiVJ9ZweXV2yd41q?=
 =?us-ascii?Q?Y2y5K5HS7XwFUmi1ykUGGCWIFik0vhGS0wioFfHH+o18p0SkKfxhPCErB4iF?=
 =?us-ascii?Q?RtDHIjAL32um5HaPoKf2tq5WMAD9kfNexiVlqWmomO1fik8GCDdmwIafmO1V?=
 =?us-ascii?Q?9Ev4vzO5P87q4eTKSSjl6AJi0P5MPXSBI0PAjm9IQppEZV4iXiBo74QKsWPB?=
 =?us-ascii?Q?wnYN1bO2xAm2MmHUo0d7fjc3eu57gXxNKEolENFVKE0Iu6LQl1auJVoKyUP+?=
 =?us-ascii?Q?NdRr4vMVh5uxqHIgcq18/Wko/roWRr1zlIGibFmn+FCtu47BgQUcYwjkGWVp?=
 =?us-ascii?Q?xrCArLP5V7dn8xkbw9h0p+GlLUn768NIGDSTN6xab6Dd3qKFiBMF4wyPuP+N?=
 =?us-ascii?Q?hctbx/z6qurAtpbX3pPL5dPfhV3n3gPZnRFAfFKG7YQpCKVcmaP0VUxOUav7?=
 =?us-ascii?Q?qrXYrFweG13eCLGX99OshQ3zf1o+3MsaUzEr2ZhJJSqGHu7FP+owYDLVjMIR?=
 =?us-ascii?Q?2nuR1HGEPavcLKZ07dpIKusYk06qZw9gIsxE8oMbRWoSrkni9oyYnF865trJ?=
 =?us-ascii?Q?P35vEeZOsiY0SJrTr/Zl7H2rwOvsmvwVanXPG90XmqjB7pipOk27MJzGforc?=
 =?us-ascii?Q?MrL4WtbS+Ba1bbMTuLe74SDcBWkIqpGVwKRrU2pjdk71K4BPQDK2qurrtsis?=
 =?us-ascii?Q?m6L68wxe0+nLWXApdoL8vpzUsF82URGoBJqByksrK56dMuSy4P1d8N4L67Ie?=
 =?us-ascii?Q?+0vIY/XUincybgj489en1RFJcpUQ8d0G6fU1j7+7OXiq2JzdXxbyIFXzSPrH?=
 =?us-ascii?Q?3efcBdq131YJVyOaxS0TaeW1YjY7JbWWNko8pxWuVrcNMGDo7GVLmiLvgLZr?=
 =?us-ascii?Q?+nfAZM3jQXIuHC3tUrM9Acdh4YOniTrCoRV89hH4tPwhTM7dhtggtd2KFosm?=
 =?us-ascii?Q?TJSDBnRRFGszeyaBiMfdnlq5I0htFBcqGQaBenRb7E5HPcCD4o8VtCLmNAln?=
 =?us-ascii?Q?KKEN5S/VIW+KmEKH1w1HaFgkwhPJWDaLCeI0gIb6WltY1oazHVoQmqmyprsr?=
 =?us-ascii?Q?Qs0WXJO/BWMtNGZpzPydR/LtQMmUgq+9SwB/7xF9YbVA9PHOh6HRfhOrFEwo?=
 =?us-ascii?Q?ih8JDVoFvNaZ0HkoAr6nDiT8FNlYiScAYNAQ+IPngGD9bxU5zQTmZBN3Zq9c?=
 =?us-ascii?Q?29AyJr4+xPQjRER4IB9hgcgjZSJaAFyZF6rokuv1LdKrGejJk+hOhW23XuWL?=
X-MS-Exchange-AntiSpam-MessageData-1: 4Iqu5t5hoBx9i/Du2lDrAMmKjtDkZWxQMj0=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f4112e92-ec79-490c-185a-08df0fe1d989
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 08:51:20.3394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BzJA3ORWBIr+I2RNFml75nRKhyfwhp1UPVKOZSxSP4l48qZ3GHkhrb3Z3aEBdcfqkbAdA8lCtK+ONMabbLiTchGLOeJ+drXn3lpzdQg8bME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZP189MB736094
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 08:51:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245622

epiphany 51.0 adds an unconditional dependency on pwquality [1]

Changes from the meta-oe version:
- add SUMMARY (required by recipe QA in OE-Core)
- add maintainer entry

[1] https://github.com/GNOME/epiphany/commit/683e9a076fa3

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 ...-Use-setuptools-instead-of-distutils.patch | 78 +++++++++++++++++++
 ...02-Makefile.am-respect-PYTHONSITEDIR.patch | 26 +++++++
 .../libpwquality/libpwquality_1.4.5.bb        | 40 ++++++++++
 4 files changed, 145 insertions(+)
 create mode 100644 meta/recipes-extended/libpwquality/files/0001-Use-setup=
tools-instead-of-distutils.patch
 create mode 100644 meta/recipes-extended/libpwquality/files/0002-Makefile.=
am-respect-PYTHONSITEDIR.patch
 create mode 100644 meta/recipes-extended/libpwquality/libpwquality_1.4.5.b=
b

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc
index 40d62042bd..4773df92fd 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -387,6 +387,7 @@ RECIPE_MAINTAINER:pn-libproxy =3D "Unassigned <unassign=
ed@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libpsl =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libpthread-stubs =3D "Unassigned <unassigned@yoctopro=
ject.org>"
 RECIPE_MAINTAINER:pn-libptytty =3D "Unassigned <unassigned@yoctoproject.or=
g>"
+RECIPE_MAINTAINER:pn-libpwquality =3D "Unassigned <unassigned@yoctoproject=
.org>"
 RECIPE_MAINTAINER:pn-librepo =3D "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER:pn-librsvg =3D "Unassigned <unassigned@yoctoproject.org>=
"
 RECIPE_MAINTAINER:pn-libsamplerate0 =3D "Unassigned <unassigned@yoctoproje=
ct.org>"
diff --git a/meta/recipes-extended/libpwquality/files/0001-Use-setuptools-i=
nstead-of-distutils.patch b/meta/recipes-extended/libpwquality/files/0001-U=
se-setuptools-instead-of-distutils.patch
new file mode 100644
index 0000000000..7eaca66b5c
--- /dev/null
+++ b/meta/recipes-extended/libpwquality/files/0001-Use-setuptools-instead-=
of-distutils.patch
@@ -0,0 +1,78 @@
+From ad95b7684365dea8335c34527d4c1463c1668af0 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Miro=3D20Hron=3DC4=3D8Dok?=3D <miro@hroncok.cz>
+Date: Fri, 31 Mar 2023 14:52:19 +0200
+Subject: [PATCH] Use setuptools instead of distutils
+
+distutils is removed from Python 3.12+:
+https://peps.python.org/pep-0632/
+
+Upstream-Status: Backport [https://github.com/libpwquality/libpwquality/co=
mmit/7b5e0f0097faebdcc6a8b783237bbba7a983147a]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ libpwquality.spec.in | 11 ++---------
+ python/Makefile.am   |  2 +-
+ python/setup.py.in   |  6 +++---
+ 3 files changed, 6 insertions(+), 13 deletions(-)
+
+diff --git a/libpwquality.spec.in b/libpwquality.spec.in
+index 70a6f53..0809126 100644
+--- a/libpwquality.spec.in
++++ b/libpwquality.spec.in
+@@ -33,9 +33,11 @@ BuildRequires: gettext
+ BuildRequires: pam-devel
+ %if %{with python2}
+ BuildRequires: python2-devel
++BuildRequires: python2-setuptools
+ %endif
+ %if %{with python3}
+ BuildRequires: python3-devel
++BuildRequires: python3-setuptools
+ %endif
+=20
+ URL: https://github.com/libpwquality/libpwquality/
+@@ -103,15 +105,6 @@ cp -a . %{py3dir}
+ pushd %{py3dir}
+ %endif
+ %if %{with python3}
+-# setuptools >=3D 60 changes the environment to use its bundled copy of d=
istutils
+-# by default, not the Python-bundled one. To run the Python's standard li=
brary
+-# distutils, the environment variable must be set.
+-# Although technically setuptools is not needed for this package, if it's
+-# pulled by another package, it changes the environment and consequently,
+-# the build fails. This was reported in:
+-# https://github.com/pypa/setuptools/issues/3143
+-export SETUPTOOLS_USE_DISTUTILS=3Dstdlib
+-
+ %configure \
+ 	--with-securedir=3D%{_moduledir} \
+ 	--with-pythonsitedir=3D%{python3_sitearch} \
+diff --git a/python/Makefile.am b/python/Makefile.am
+index 1d00c0c..6e51744 100644
+--- a/python/Makefile.am
++++ b/python/Makefile.am
+@@ -14,7 +14,7 @@ all-local:
+ 	CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py build =
--build-base py$(PYTHONREV)
+=20
+ install-exec-local:
+-	CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py build =
--build-base py$(PYTHONREV) install --prefix=3D${DESTDIR}${prefix}
++	CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py build =
--build-base py$(PYTHONREV) install --root ${DESTDIR} --prefix=3D${prefix}
+=20
+ clean-local:
+ 	rm -rf py$(PYTHONREV)
+diff --git a/python/setup.py.in b/python/setup.py.in
+index a741b91..f934c50 100755
+--- a/python/setup.py.in
++++ b/python/setup.py.in
+@@ -6,9 +6,9 @@
+=20
+ import os
+=20
+-from distutils.core import setup, Extension
+-from distutils.command.build_ext import build_ext as _build_ext
+-from distutils.command.sdist import sdist as _sdist
++from setuptools import setup, Extension
++from setuptools.command.build_ext import build_ext as _build_ext
++from setuptools.command.sdist import sdist as _sdist
+=20
+ def genconstants(headerfile, outputfile):
+     hf =3D open(headerfile, 'r')
diff --git a/meta/recipes-extended/libpwquality/files/0002-Makefile.am-resp=
ect-PYTHONSITEDIR.patch b/meta/recipes-extended/libpwquality/files/0002-Mak=
efile.am-respect-PYTHONSITEDIR.patch
new file mode 100644
index 0000000000..cd59a6d887
--- /dev/null
+++ b/meta/recipes-extended/libpwquality/files/0002-Makefile.am-respect-PYT=
HONSITEDIR.patch
@@ -0,0 +1,26 @@
+From edc51ba1b446913232cdf2945f485392bca72dc7 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 3 Aug 2015 13:43:14 +0800
+Subject: [PATCH] Makefile.am: respect ${PYTHONSITEDIR}
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+Upstream-Status: Backport [https://github.com/libpwquality/libpwquality/co=
mmit/5192eab011ada47b0157f8d0524bf5b18bba3bd0]
+
+ python/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/python/Makefile.am b/python/Makefile.am
+index 6e51744..0a3bad5 100644
+--- a/python/Makefile.am
++++ b/python/Makefile.am
+@@ -14,7 +14,7 @@ all-local:
+ 	CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py build =
--build-base py$(PYTHONREV)
+=20
+ install-exec-local:
+-	CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py build =
--build-base py$(PYTHONREV) install --root ${DESTDIR} --prefix=3D${prefix}
++	CFLAGS=3D"${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py build =
--build-base py$(PYTHONREV) install --root ${DESTDIR} --prefix=3D${prefix} =
--install-lib=3D$(pythonsitedir)
+=20
+ clean-local:
+ 	rm -rf py$(PYTHONREV)
diff --git a/meta/recipes-extended/libpwquality/libpwquality_1.4.5.bb b/met=
a/recipes-extended/libpwquality/libpwquality_1.4.5.bb
new file mode 100644
index 0000000000..a303b9e758
--- /dev/null
+++ b/meta/recipes-extended/libpwquality/libpwquality_1.4.5.bb
@@ -0,0 +1,40 @@
+SUMMARY =3D "Password quality checking and random password generation libr=
ary"
+DESCRIPTION =3D "Library for password quality checking and generating rand=
om passwords"
+HOMEPAGE =3D "https://github.com/libpwquality/libpwquality"
+SECTION =3D "devel/lib"
+
+LICENSE =3D "GPL-2.0-or-later"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bd2f1386df813a459a0c34fde676fc=
2"
+
+DEPENDS =3D "cracklib"
+
+SRC_URI =3D "git://github.com/libpwquality/libpwquality;branch=3Dmaster;pr=
otocol=3Dhttps \
+    file://0001-Use-setuptools-instead-of-distutils.patch \
+    file://0002-Makefile.am-respect-PYTHONSITEDIR.patch \
+"
+SRCREV =3D "5490e96a3dd6ed7371435ca5b3ccef98bdb48b5a"
+
+
+inherit autotools-brokensep gettext
+inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'setuptools=
3-base', '', d)}
+
+do_configure:prepend() {
+    cp ${STAGING_DATADIR_NATIVE}/gettext/ABOUT-NLS ${AUTOTOOLS_AUXDIR}/
+}
+
+export PYTHON_DIR
+export BUILD_SYS
+export HOST_SYS
+
+EXTRA_OECONF +=3D "--libdir=3D${libdir} \
+                 --with-securedir=3D${base_libdir}/security \
+"
+
+PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam',=
 '', d)} python3"
+PACKAGECONFIG[pam] =3D "--enable-pam,--disable-pam,libpam"
+PACKAGECONFIG[python3] =3D "--enable-python-bindings --with-python-rev=3D$=
{PYTHON_BASEVERSION} --with-python-binary=3D${STAGING_BINDIR_NATIVE}/python=
3-native/python3 --with-pythonsitedir=3D${PYTHON_SITEPACKAGES_DIR},--disabl=
e-python-bindings,python3-setuptools-native"
+
+FILES:${PN} +=3D "${base_libdir}/security/pam_pwquality.so"
+FILES:${PN}-dbg +=3D "${base_libdir}/security/.debug"
+FILES:${PN}-staticdev +=3D "${base_libdir}/security/pam_pwquality.a"
+FILES:${PN}-dev +=3D "${base_libdir}/security/pam_pwquality.la"

