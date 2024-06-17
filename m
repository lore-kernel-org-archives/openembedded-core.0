Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 281E8C2BB85
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 06:34:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.50587.1718606076520822993
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jun 2024 23:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6898887b7c=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45H5udN1011983
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Jun 2024 23:34:36 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ysafg1633-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Jun 2024 23:34:36 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 16 Jun 2024 23:34:35 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sun, 16 Jun 2024 23:34:34 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 3/8] zip: Fix build with gcc-14
Date: Mon, 17 Jun 2024 14:34:26 +0800
Message-ID: <20240617063431.2221035-4-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240617063431.2221035-1-changqing.li@windriver.com>
References: <20240617063431.2221035-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: ZuUz8cCAkUbqRwudUl2IGLbnzok0LW7Y
X-Proofpoint-ORIG-GUID: ZuUz8cCAkUbqRwudUl2IGLbnzok0LW7Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_05,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=491 clxscore=1015
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2405170001
 definitions=main-2406170049
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 45H5udN1011983
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 06:34:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200789

From: Khem Raj <raj.khem@gmail.com>

zip's configure fails to link this piece of test code:

  int main() { return closedir(opendir(".")); }

with GCC-14 because it now treats implicit declaration of function
as error, unline older GCC version where it was just a warning
and this test would build fine.

Remove 0002-unix.c-Do-not-redefine-DIR-as-FILE.patch which
is now unnecessary.

(From OE-Core rev: 3422411eb750c7e960b81676637cfb321dbadefb)

Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...e-dirent.h-for-closedir-opendir-APIs.patch | 45 +++++++++++++++++++
 ...2-unix.c-Do-not-redefine-DIR-as-FILE.patch | 35 ---------------
 meta/recipes-extended/zip/zip_3.0.bb          |  2 +-
 3 files changed, 46 insertions(+), 36 deletions(-)
 create mode 100644 meta/recipes-extended/zip/zip-3.0/0001-configure-Incl=
ude-dirent.h-for-closedir-opendir-APIs.patch
 delete mode 100644 meta/recipes-extended/zip/zip-3.0/0002-unix.c-Do-not-=
redefine-DIR-as-FILE.patch

diff --git a/meta/recipes-extended/zip/zip-3.0/0001-configure-Include-dir=
ent.h-for-closedir-opendir-APIs.patch b/meta/recipes-extended/zip/zip-3.0=
/0001-configure-Include-dirent.h-for-closedir-opendir-APIs.patch
new file mode 100644
index 0000000000..0d3af37ded
--- /dev/null
+++ b/meta/recipes-extended/zip/zip-3.0/0001-configure-Include-dirent.h-f=
or-closedir-opendir-APIs.patch
@@ -0,0 +1,45 @@
+From 9db2f8cdbbc0dfb359d3b4e5dfe48c18652ce531 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 8 May 2024 19:02:46 -0700
+Subject: [PATCH] configure: Include dirent.h for closedir/opendir APIs
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+GCC-14 is strict about function prototypes and since the
+testcase tries to compile/link opendir/closedir functions
+without including signatures, it fails to build the test
+due to missing signatures which come from dirent.h
+
+Therefore include the needed system header and make it more
+robust.
+
+Fixes
+a.c:2:21: error: implicit declaration of function =E2=80=98closedir=E2=80=
=99 [-Wimplicit-function-declaration]
+    2 | int main() { return closedir(opendir(".")); }
+      |                     ^~~~~~~~
+a.c:2:30: error: implicit declaration of function =E2=80=98opendir=E2=80=
=99 [-Wimplicit-function-declaration]
+    2 | int main() { return closedir(opendir(".")); }
+      |                              ^~~~~~~
+
+Upstream-Status: Inactive-Upstream
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ unix/configure | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/unix/configure b/unix/configure
+index f917086..1dd98c6 100644
+--- a/unix/configure
++++ b/unix/configure
+@@ -591,6 +591,7 @@ $CC $CFLAGS -c conftest.c >/dev/null 2>/dev/null
+=20
+ echo Check for directory libraries
+ cat > conftest.c << _EOF_
++#include <dirent.h>
+ int main() { return closedir(opendir(".")); }
+ _EOF_
+=20
+--=20
+2.45.0
+
diff --git a/meta/recipes-extended/zip/zip-3.0/0002-unix.c-Do-not-redefin=
e-DIR-as-FILE.patch b/meta/recipes-extended/zip/zip-3.0/0002-unix.c-Do-no=
t-redefine-DIR-as-FILE.patch
deleted file mode 100644
index a86e03e620..0000000000
--- a/meta/recipes-extended/zip/zip-3.0/0002-unix.c-Do-not-redefine-DIR-a=
s-FILE.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 76f5bf3546d826dcbc03acbefcf0b10b972bf136 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 10 Aug 2022 17:19:38 -0700
-Subject: [PATCH 2/2] unix.c: Do not redefine DIR as FILE
-
-DIR is already provided on Linux via
-/usr/include/dirent.h system header
-
-Upstream-Status: Inactive-Upstream
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- unix/unix.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/unix/unix.c b/unix/unix.c
-index ba87614..6e6f4d2 100644
---- a/unix/unix.c
-+++ b/unix/unix.c
-@@ -61,13 +61,11 @@ local time_t label_utim =3D 0;
- /* Local functions */
- local char *readd OF((DIR *));
-=20
--
- #ifdef NO_DIR                    /* for AT&T 3B1 */
- #include <sys/dir.h>
- #ifndef dirent
- #  define dirent direct
- #endif
--typedef FILE DIR;
- /*
- **  Apparently originally by Rich Salz.
- **  Cleaned up and modified by James W. Birdsall.
---=20
-2.37.1
-
diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended=
/zip/zip_3.0.bb
index 70df5ab872..ec54206335 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -17,8 +17,8 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/infozip/Zip%203.x%20=
%28latest%29/3.0/zip30.tar.
            file://0002-configure-support-PIC-code-build.patch \
            file://0001-configure-Use-CFLAGS-and-LDFLAGS-when-doing-link-=
tes.patch \
            file://0001-configure-Specify-correct-function-signatures-and=
-de.patch \
-           file://0002-unix.c-Do-not-redefine-DIR-as-FILE.patch \
            file://0001-unix-configure-use-_Static_assert-to-do-correct-d=
ete.patch \
+           file://0001-configure-Include-dirent.h-for-closedir-opendir-A=
PIs.patch \
            "
 UPSTREAM_VERSION_UNKNOWN =3D "1"
=20
--=20
2.25.1


