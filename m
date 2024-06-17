Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B2CC2BA16
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 06:34:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.50589.1718606079381677096
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jun 2024 23:34:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6898887b7c=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45H5FM1w006186
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Jun 2024 23:34:39 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ys682ha6n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Jun 2024 23:34:38 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 16 Jun 2024 23:34:38 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sun, 16 Jun 2024 23:34:37 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 6/8] cdrtools-native: Fix build with GCC 14
Date: Mon, 17 Jun 2024 14:34:29 +0800
Message-ID: <20240617063431.2221035-7-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240617063431.2221035-1-changqing.li@windriver.com>
References: <20240617063431.2221035-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: UcJPV9gXEt6cqCa58wfSWd23LQsHxo0F
X-Proofpoint-GUID: UcJPV9gXEt6cqCa58wfSWd23LQsHxo0F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_05,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=840
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406170049
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 45H5FM1w006186
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 06:34:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200792

From: Zoltan Boszormenyi <zboszor@gmail.com>

Add a patch to fix do_configure with GCC 14.
Disable building cdda2wav because it doesn't build with GCC 14.

(From OE-Core rev: 0fbe1766abb00edeb8ec9a0c8bdb4e723be4f352)

Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../cdrtools/cdrtools-native_3.01.bb                |  6 +++++-
 .../cdrtools/cdrtools/gcc14-fix.patch               | 13 +++++++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/cdrtools/cdrtools/gcc14-fix.pat=
ch

diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb b/met=
a/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
index 0fe661ae6a..ca9fc5988a 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
@@ -13,7 +13,8 @@ DEPENDS +=3D "gnu-config-native"
 SRC_URI =3D " \
 	${SOURCEFORGE_MIRROR}/project/cdrtools/cdrtools-${PV}.tar.bz2 \
 	file://0001-Don-t-set-uid-gid-during-install.patch \
-        file://riscv64-linux-gcc.rul \
+	file://riscv64-linux-gcc.rul \
+	file://gcc14-fix.patch \
 	"
=20
 SRC_URI[md5sum] =3D "7d45c5b7e1f78d85d1583b361aee6e8b"
@@ -31,6 +32,9 @@ inherit native
 CFLAGS +=3D "-std=3Dgnu89"
=20
 do_configure() {
+        # cdda2wav does not build with GCC 14
+        rm -f ${S}/TARGETS/55cdda2wav
+
         install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub =
${S}/autoconf
         install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.gues=
s ${S}/autoconf
         install -m 0644 ${WORKDIR}/riscv64-linux-gcc.rul ${S}/RULES/
diff --git a/meta/recipes-devtools/cdrtools/cdrtools/gcc14-fix.patch b/me=
ta/recipes-devtools/cdrtools/cdrtools/gcc14-fix.patch
new file mode 100644
index 0000000000..ce02bb8bcf
--- /dev/null
+++ b/meta/recipes-devtools/cdrtools/cdrtools/gcc14-fix.patch
@@ -0,0 +1,13 @@
+Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com=
>
+Upstream-Status: Inappropriate [native]
+--- cdrtools-3.01/autoconf/configure~	2015-07-06 23:41:27.000000000 +020=
0
++++ cdrtools-3.01/autoconf/configure	2024-05-01 09:37:40.897253690 +0200
+@@ -1205,7 +1205,7 @@
+ #line 1206 "configure"
+ #include "confdefs.h"
+=20
+-main(){return(0);}
++int main(){return(0);}
+ EOF
+ if { (eval echo configure:1211: \"$ac_link\") 1>&5; (eval $ac_link) 2>&=
5; } && test -s conftest${ac_exeext}; then
+   ac_cv_prog_cc_works=3Dyes
--=20
2.25.1


