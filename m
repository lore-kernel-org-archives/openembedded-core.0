Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D7FD1D877
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 06:44:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37675.1764830672463618603
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 22:44:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CaFRhfly;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44334587b6=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B46axHk2214406
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Dec 2025 06:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=mNRjR1foEDmLK+iRvKdH
	bzPyUMGQbUale09aIlm2H3o=; b=CaFRhflySGfdaQKG5yvKqDS3pgnBGc/S8KWE
	zGSk6Y0HSxp4MV5AWN64hYt8cM6o4QLAZfJiIjLXjhPk/7p6Oq5oXx346wyENmyn
	l3kzmOj1EDlfBRd1rcRXIZ5rq131rV9DDaMPRZz7e33D67NUbq7IGE3E31pqKp1x
	fv1bB/KB/qFHOwHjFePPvpgzi2axQE2mzb7UCxxbvLNzmMxWbE5BmhgcFFf/knoE
	3IgcbTny4L9tL9r0OvOrAslKY6G7D00Pxp0xT1iy81/IsAb9DEyB4wzj9ymWpAOq
	7qHD8pw7V920M2XcP+5MZxhn2LKwvU4raHtpcBZunJzA5mpUfw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqp21x4ee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 06:44:30 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 3 Dec 2025 22:44:29 -0800
Received: from oak-lpgbuild14.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 3 Dec 2025 22:44:29 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 1/3] coreutils: upgrade from 9.7 to 9.9
Date: Thu, 4 Dec 2025 06:44:27 +0000
Message-ID: <20251204064429.559529-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: WrDPoPgcLv7kqw0HzLQpLz8XmXGXRiHP
X-Authority-Analysis: v=2.4 cv=OLAqHCaB c=1 sm=1 tr=0 ts=69312dcf cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8
 a=BCVRRYYnAAAA:8 a=D5MSFDpMHbgLSbss9u8A:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=Yfo1nd69h7ycsZ8reatu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA1MyBTYWx0ZWRfX0Dk9eKDBbZbk
 EA+9j3dZouMzlBO9thFzzDJT5Opl1PxkwgZ7Kf8vfxj/qsdm65pNZdyzqXhsOXqdXl6uH+cDsXR
 yN7NC9Tm7remvpX8eW0tckXCn/w2NDn5Bzo3s0pOf//u7SDpohivY8Nh24zpEGmKABcGKapfGuv
 ibmAIJ+5bFdN7H8vSnNGK6asFgIK6mN126JQw6vQN26ef21MaHZ+Wz9NoPlv9vwT4m5zrL1KQAM
 F62iBJsW9FUGubZmPHfczJ8GVbgl69Xv+mTv28MtGU6JJzEQamTct79M8tgcOXXVaPUgZzQT0ge
 Ug6BJqi6ZunICwpJ+rzgVeMFSw91hd9PBElxyHpejle05EkmrqlvELnsEooy8FFDh4TYZZqvbhs
 bl5MevPn/FJ7w3nmEeSvaX1Rl3Lesw==
X-Proofpoint-ORIG-GUID: WrDPoPgcLv7kqw0HzLQpLz8XmXGXRiHP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 06:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227270

From: Chen Qi <Qi.Chen@windriver.com>

0001-sort-fix-buffer-under-read-CWE-127.patch is dropped as it has
been in version 9.9.

Adapt to upstream change about chcon and runcon:
https://gitweb.git.savannah.gnu.org/gitweb/?p=coreutils.git;a=commit;h=8ba47d09a33f0740e071a8394f3504e0fb57948e
They are not built unless selinux is available.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...1-sort-fix-buffer-under-read-CWE-127.patch | 112 ------------------
 .../{coreutils_9.7.bb => coreutils_9.9.bb}    |  12 +-
 2 files changed, 7 insertions(+), 117 deletions(-)
 delete mode 100644 meta/recipes-core/coreutils/coreutils/0001-sort-fix-buffer-under-read-CWE-127.patch
 rename meta/recipes-core/coreutils/{coreutils_9.7.bb => coreutils_9.9.bb} (95%)

diff --git a/meta/recipes-core/coreutils/coreutils/0001-sort-fix-buffer-under-read-CWE-127.patch b/meta/recipes-core/coreutils/coreutils/0001-sort-fix-buffer-under-read-CWE-127.patch
deleted file mode 100644
index 41be1635b5..0000000000
--- a/meta/recipes-core/coreutils/coreutils/0001-sort-fix-buffer-under-read-CWE-127.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From 8763c305c29d0abb7e2be4695212b42917d054b2 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?P=C3=A1draig=20Brady?= <P@draigBrady.com>
-Date: Tue, 20 May 2025 16:03:44 +0100
-Subject: [PATCH] sort: fix buffer under-read (CWE-127)
-
-* src/sort.c (begfield): Check pointer adjustment
-to avoid Out-of-range pointer offset (CWE-823).
-(limfield): Likewise.
-* tests/sort/sort-field-limit.sh: Add a new test,
-which triggers with ASAN or Valgrind.
-* tests/local.mk: Reference the new test.
-* NEWS: Mention bug fix introduced in v7.2 (2009).
-Fixes https://bugs.gnu.org/78507
-
-CVE: CVE-2025-5278
-
-Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/coreutils.git/commit/?id=8c9602e3a145e9596dc1a63c6ed67865814b6633]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/sort.c                     | 12 ++++++++++--
- tests/local.mk                 |  1 +
- tests/sort/sort-field-limit.sh | 35 ++++++++++++++++++++++++++++++++++
- 3 files changed, 46 insertions(+), 2 deletions(-)
- create mode 100755 tests/sort/sort-field-limit.sh
-
-diff --git a/src/sort.c b/src/sort.c
-index b10183b6f..7af1a2512 100644
---- a/src/sort.c
-+++ b/src/sort.c
-@@ -1644,7 +1644,11 @@ begfield (struct line const *line, struct keyfield const *key)
-       ++ptr;
- 
-   /* Advance PTR by SCHAR (if possible), but no further than LIM.  */
--  ptr = MIN (lim, ptr + schar);
-+  size_t remaining_bytes = lim - ptr;
-+  if (schar < remaining_bytes)
-+    ptr += schar;
-+  else
-+    ptr = lim;
- 
-   return ptr;
- }
-@@ -1746,7 +1750,11 @@ limfield (struct line const *line, struct keyfield const *key)
-           ++ptr;
- 
-       /* Advance PTR by ECHAR (if possible), but no further than LIM.  */
--      ptr = MIN (lim, ptr + echar);
-+      size_t remaining_bytes = lim - ptr;
-+      if (echar < remaining_bytes)
-+        ptr += echar;
-+      else
-+        ptr = lim;
-     }
- 
-   return ptr;
-diff --git a/tests/local.mk b/tests/local.mk
-index 4da6756ac..642d225fa 100644
---- a/tests/local.mk
-+++ b/tests/local.mk
-@@ -388,6 +388,7 @@ all_tests =					\
-   tests/sort/sort-debug-keys.sh			\
-   tests/sort/sort-debug-warn.sh			\
-   tests/sort/sort-discrim.sh			\
-+  tests/sort/sort-field-limit.sh		\
-   tests/sort/sort-files0-from.pl		\
-   tests/sort/sort-float.sh			\
-   tests/sort/sort-h-thousands-sep.sh		\
-diff --git a/tests/sort/sort-field-limit.sh b/tests/sort/sort-field-limit.sh
-new file mode 100755
-index 000000000..52d8e1d17
---- /dev/null
-+++ b/tests/sort/sort-field-limit.sh
-@@ -0,0 +1,35 @@
-+#!/bin/sh
-+# From 7.2-9.7, this would trigger an out of bounds mem read
-+
-+# Copyright (C) 2025 Free Software Foundation, Inc.
-+
-+# This program is free software: you can redistribute it and/or modify
-+# it under the terms of the GNU General Public License as published by
-+# the Free Software Foundation, either version 3 of the License, or
-+# (at your option) any later version.
-+
-+# This program is distributed in the hope that it will be useful,
-+# but WITHOUT ANY WARRANTY; without even the implied warranty of
-+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+# GNU General Public License for more details.
-+
-+# You should have received a copy of the GNU General Public License
-+# along with this program.  If not, see <https://www.gnu.org/licenses/>.
-+
-+. "${srcdir=.}/tests/init.sh"; path_prepend_ ./src
-+print_ver_ sort
-+getlimits_
-+
-+# This issue triggers with valgrind or ASAN
-+valgrind --error-exitcode=1 sort --version 2>/dev/null &&
-+  VALGRIND='valgrind --error-exitcode=1'
-+
-+{ printf '%s\n' aa bb; } > in || framework_failure_
-+
-+_POSIX2_VERSION=200809 $VALGRIND sort +0.${SIZE_MAX}R in > out || fail=1
-+compare in out || fail=1
-+
-+_POSIX2_VERSION=200809 $VALGRIND sort +1 -1.${SIZE_MAX}R in > out || fail=1
-+compare in out || fail=1
-+
-+Exit $fail
--- 
-2.34.1
-
diff --git a/meta/recipes-core/coreutils/coreutils_9.7.bb b/meta/recipes-core/coreutils/coreutils_9.9.bb
similarity index 95%
rename from meta/recipes-core/coreutils/coreutils_9.7.bb
rename to meta/recipes-core/coreutils/coreutils_9.9.bb
index 201be4144c..cded545efb 100644
--- a/meta/recipes-core/coreutils/coreutils_9.7.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.9.bb
@@ -15,10 +15,9 @@ inherit autotools gettext texinfo
 
 SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
-           file://0001-sort-fix-buffer-under-read-CWE-127.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "e8bb26ad0293f9b5a1fc43fb42ba970e312c66ce92c1b0b16713d7500db251bf"
+SRC_URI[sha256sum] = "19bcb6ca867183c57d77155eae946c5eced88183143b45ca51ad7d26c628ca75"
 
 # http://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=v8.27-101-gf5d7c0842
 #
@@ -47,13 +46,16 @@ PACKAGECONFIG[single-binary] = "--enable-single-binary,--disable-single-binary,,
 PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
 PACKAGECONFIG[openssl] = "--with-openssl=yes,--with-openssl=no,openssl"
 
+selinux_progs = "${@'chcon runcon' if 'selinux' in d.getVar('PACKAGECONFIG') else ''}"
+
 # [ base32 base64 df mktemp nice printenv get a special treatment and are not included in this
-bindir_progs = "arch basename chcon cksum comm csplit cut dir dircolors dirname du \
+bindir_progs = "arch basename cksum comm csplit cut dir dircolors dirname du \
                 env expand expr factor fmt fold groups head hostid id install \
                 join link logname md5sum mkfifo nl nohup nproc od paste pathchk \
-                pinky pr printf ptx readlink realpath runcon seq sha1sum sha224sum sha256sum \
+                pinky pr printf ptx readlink realpath seq sha1sum sha224sum sha256sum \
                 sha384sum sha512sum shred shuf sort split sum tac tail tee test timeout \
-                tr truncate tsort tty unexpand uniq unlink uptime users vdir wc who whoami yes"
+                tr truncate tsort tty unexpand uniq unlink uptime users vdir wc who whoami yes \
+                ${selinux_progs}"
 
 base_bindir_progs = "cat chgrp chmod chown cp date dd echo false hostname kill ln ls mkdir \
                      mknod mv pwd rm rmdir sleep stty sync touch true uname stat"
-- 
2.43.0


