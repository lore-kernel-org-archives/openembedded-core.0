Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04966C27C77
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 06:34:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.50169.1718606077367185221
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jun 2024 23:34:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6898887b7c=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45H67ma7014253
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Jun 2024 23:34:37 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ys682ha6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Jun 2024 23:34:36 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 16 Jun 2024 23:34:36 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sun, 16 Jun 2024 23:34:35 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 4/8] db: ignore implicit-int and implicit-function-declaration issues fatal with gcc-14
Date: Mon, 17 Jun 2024 14:34:27 +0800
Message-ID: <20240617063431.2221035-5-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240617063431.2221035-1-changqing.li@windriver.com>
References: <20240617063431.2221035-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: z2kqg1PV_exjQ834LvpxQ10rM5JOBG9V
X-Proofpoint-GUID: z2kqg1PV_exjQ834LvpxQ10rM5JOBG9V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_05,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406170049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 06:34:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200790

From: Martin Jansa <martin.jansa@gmail.com>

* many configure tests (which might not fail before) are failing with gcc-1=
4:
  # grep implicit build/config.log
  conftest.c:47:1: error: return type defaults to 'int' [-Wimplicit-int]
  conftest.c:47:1: error: return type defaults to 'int' [-Wimplicit-int]
  conftest.c:47:1: error: return type defaults to 'int' [-Wimplicit-int]
  conftest.c:47:1: error: return type defaults to 'int' [-Wimplicit-int]
  conftest.c:47:1: error: return type defaults to 'int' [-Wimplicit-int]
  conftest.c:47:1: error: return type defaults to 'int' [-Wimplicit-int]
  conftest.c:50:17: error: implicit declaration of function 'exit' [-Wimpli=
cit-function-declaration]
  conftest.c:50:17: warning: incompatible implicit declaration of built-in =
function 'exit' [-Wbuiltin-declaration-mismatch]
  conftest.c:53:9: error: implicit declaration of function 'msem_init' [-Wi=
mplicit-function-declaration]
  conftest.c:54:9: error: implicit declaration of function 'msem_lock' [-Wi=
mplicit-function-declaration]
  conftest.c:55:9: error: implicit declaration of function 'msem_unlock' [-=
Wimplicit-function-declaration]
  conftest.c:56:9: error: implicit declaration of function 'exit' [-Wimplic=
it-function-declaration]
  conftest.c:56:9: warning: incompatible implicit declaration of built-in f=
unction 'exit' [-Wbuiltin-declaration-mismatch]
  conftest.c:50:9: error: implicit declaration of function '_spin_lock_try'=
 [-Wimplicit-function-declaration]
  conftest.c:51:9: error: implicit declaration of function '_spin_unlock' [=
-Wimplicit-function-declaration]

* I have noticed this on db-native build on host with gcc-14
  where it caused fatal do_configure error:
  http://errors.yoctoproject.org/Errors/Details/784164/

  checking for mutexes... UNIX/fcntl
  configure: error: Support for FCNTL mutexes was removed in BDB 4.8.

  the config.log confirms it's because implicit-int:

  configure:22798: checking for mutexes
  configure:22925: gcc  -o conftest -isystem/OE/build/oe-core/tmp-glibc/wor=
k/x86_64-linux/db-native/5.3.28/recipe-sysroot-native/usr/include -O2 -pipe=
  -isystem/OE/build/oe-core/tmp-glibc/work/x86_64-linux/db-native/5.3.28/re=
cipe-sysroot-native/usr/include -D_GNU_SOURCE -D_REENTRANT -L/OE/build/oe-c=
ore/tmp-glibc/work/x86_64-linux/db-native/5.3.28/recipe-sysroot-native/usr/=
lib                         -L/OE/build/oe-core/tmp-glibc/work/x86_64-linux=
/db-native/5.3.28/recipe-sysroot-native/lib                         -Wl,--e=
nable-new-dtags                         -Wl,-rpath-link,/OE/build/oe-core/t=
mp-glibc/work/x86_64-linux/db-native/5.3.28/recipe-sysroot-native/usr/lib  =
                       -Wl,-rpath-link,/OE/build/oe-core/tmp-glibc/work/x86=
_64-linux/db-native/5.3.28/recipe-sysroot-native/lib                       =
  -Wl,-rpath,/OE/build/oe-core/tmp-glibc/work/x86_64-linux/db-native/5.3.28=
/recipe-sysroot-native/usr/lib                         -Wl,-rpath,/OE/build=
/oe-core/tmp-glibc/work/x86_64-linux/db-native/5.3.28/recipe-sysroot-native=
/lib                         -Wl,-O1 conftest.c  -lpthread >&5
  conftest.c:47:1: error: return type defaults to 'int' [-Wimplicit-int]
     47 | main() {
        | ^~~~
  configure:22925: $? =3D 1
  configure: program exited with status 1

* comparing target db with and without this change shows following diff
  in log.do_configure:

  db $ diff 5.3.28*/temp/log.do_configure
  268c268
  < checking for mutexes... POSIX/pthreads/library
  ---
  > checking for mutexes... POSIX/pthreads/library/x86_64/gcc-assembly
  271c271
  < checking for atomic operations... no
  ---
  > checking for atomic operations... x86/gcc-assembly

(From OE-Core rev: 6108da955e7c553247ff5356cf1c990b3d334edf)

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-support/db/db_5.3.28.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db=
/db_5.3.28.bb
index a99d5cea62..a7d061e0da 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -116,3 +116,7 @@ INSANE_SKIP:${PN} =3D "dev-so"
 INSANE_SKIP:${PN}-cxx =3D "dev-so"
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+# many configure tests are failing with gcc-14
+CFLAGS +=3D "-Wno-error=3Dimplicit-int -Wno-error=3Dimplicit-function-decl=
aration"
+BUILD_CFLAGS +=3D "-Wno-error=3Dimplicit-int -Wno-error=3Dimplicit-functio=
n-declaration"
--=20
2.25.1


