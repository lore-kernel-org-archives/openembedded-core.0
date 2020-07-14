Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.4720.1594756319653618578
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2020 12:52:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ssajal@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06EJpMSv007822
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2020 12:51:48 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Tue, 14 Jul 2020
 12:51:29 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 20885)	id 6571F1FF23;
 Tue, 14 Jul 2020 15:51:28 -0400 (EDT)
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Sakib Sajal <sakib.sajal@windriver.com>
Subject: [PATCH 2/4] qemu: fix CVE-2020-13659
Date: Tue, 14 Jul 2020 15:51:17 -0400
Message-ID: <20200714195119.20074-2-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714195119.20074-1-sakib.sajal@windriver.com>
References: <20200714195119.20074-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 06EJpMSv007822
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-13659.patch            | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13659.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 98bdff7ac6..a9ef3b78bf 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -33,6 +33,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
 	   file://find_datadir.patch \
 	   file://CVE-2020-10761.patch \
 	   file://CVE-2020-13362.patch \
+	   file://CVE-2020-13659.patch \
 	   "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13659.patch b/meta/=
recipes-devtools/qemu/qemu/CVE-2020-13659.patch
new file mode 100644
index 0000000000..4d12ae8f16
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-13659.patch
@@ -0,0 +1,58 @@
+From 77f55eac6c433e23e82a1b88b2d74f385c4c7d82 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Tue, 26 May 2020 16:47:43 +0530
+Subject: [PATCH] exec: set map length to zero when returning NULL
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+When mapping physical memory into host's virtual address space,
+'address_space_map' may return NULL if BounceBuffer is in_use.
+Set and return '*plen =3D 0' to avoid later NULL pointer dereference.
+
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Fixes: https://bugs.launchpad.net/qemu/+bug/1878259
+Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
+Suggested-by: Peter Maydell <peter.maydell@linaro.org>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Message-Id: <20200526111743.428367-1-ppandit@redhat.com>
+Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+
+Upstream-Status: Backport [77f55eac6c433e23e82a1b88b2d74f385c4c7d82]
+CVE: CVE-2020-13659
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ exec.c                | 1 +
+ include/exec/memory.h | 3 ++-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/exec.c b/exec.c
+index 9cbde85d8c..778263f1c6 100644
+--- a/exec.c
++++ b/exec.c
+@@ -3540,6 +3540,7 @@ void *address_space_map(AddressSpace *as,
+=20
+     if (!memory_access_is_direct(mr, is_write)) {
+         if (atomic_xchg(&bounce.in_use, true)) {
++            *plen =3D 0;
+             return NULL;
+         }
+         /* Avoid unbounded allocations */
+diff --git a/include/exec/memory.h b/include/exec/memory.h
+index bd7fdd6081..af8ca7824e 100644
+--- a/include/exec/memory.h
++++ b/include/exec/memory.h
+@@ -2314,7 +2314,8 @@ bool address_space_access_valid(AddressSpace *as, =
hwaddr addr, hwaddr len,
+ /* address_space_map: map a physical memory region into a host virtual =
address
+  *
+  * May map a subset of the requested range, given by and returned in @p=
len.
+- * May return %NULL if resources needed to perform the mapping are exha=
usted.
++ * May return %NULL and set *@plen to zero(0), if resources needed to p=
erform
++ * the mapping are exhausted.
+  * Use only for reads OR writes - not for read-modify-write operations.
+  * Use cpu_register_map_client() to know when retrying the map operatio=
n is
+  * likely to succeed.
+--=20
+2.20.1
+
--=20
2.27.0

