Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72694C43334
	for <webhook@archiver.kernel.org>; Sat, 25 Jun 2022 22:39:57 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.24571.1656196790212247265
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jun 2022 15:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=VZwPzvtM;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id EA33383D9C;
	Sun, 26 Jun 2022 00:39:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1656196788;
	bh=Mpl3qqCgFxW7ftjybxqWoZtIMk0IvykwrfAxbw/5YEU=;
	h=From:To:Cc:Subject:Date:From;
	b=VZwPzvtM2JQEKaQ/xL96wJWMf3++Q22qb9z94iOlLGA1bUpqjxDa+40PZBi4maqbj
	 H8QLXCsW8Jtm2zAY/JMmCmGb8VeOTwDBoAPtOA4hMzGGkablcEgj1u4up2mSDLroUv
	 +2MVcyKreU4tHixLOexbQJvoJjw7o5sBEggDO6XKRK9PHccDwhII4Vi5a2BoGi4s+n
	 QJdFGrrHL8IYD8qD8FSE4jXZHQvNt1n18Din/O8ae6esL4Rihf8L6EVT9kROJJGJ/R
	 zvv1dxKR9GqQrIsO1JmqdqxhD9rDYTmTWkC2Zh/4D/0a1Xdkgqw4nl+zIfN+R0akiZ
	 o3iov68Un6S5g==
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Marek Vasut <marex@denx.de>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [dunfell][PATCH] lttng-modules: Backport Linux 5.18+, 5.15.44+,
 5.10.119+ fixes
Date: Sun, 26 Jun 2022 00:39:36 +0200
Message-Id: <20220625223936.135521-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jun 2022 22:39:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167299

The Linux kernel commit 14c174633f349 ("random: remove unused tracepoints=
")
removed unused tracepoints and has been backported to stable Linux kernel
releases. This causes build failure of lttng-modules:

"
lttng-modules-2.11.6/probes/lttng-probe-random.c:18:10: fatal error: trac=
e/events/random.h: No such file or directory
|    18 | #include <trace/events/random.h>
|       |          ^~~~~~~~~~~~~~~~~~~~~~~
| compilation terminated.
"

Backport patches from lttng-modules master branch to address the build
failure on all of Linux 5.18.y, 5.15.y and 5.10.y kernel versions.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>
---
 ...ndom-remove-unused-tracepoints-v5.18.patch | 46 +++++++++++++++++
 ...emove-unused-tracepoints-v5.10-v5.15.patch | 45 ++++++++++++++++
 ...racepoints-removed-in-stable-kernels.patch | 51 +++++++++++++++++++
 .../lttng/lttng-modules_2.11.6.bb             |  3 ++
 4 files changed, 145 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0017-fix-rand=
om-remove-unused-tracepoints-v5.18.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0018-fix-rand=
om-remove-unused-tracepoints-v5.10-v5.15.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0019-fix-rand=
om-tracepoints-removed-in-stable-kernels.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0017-fix-random-remo=
ve-unused-tracepoints-v5.18.patch b/meta/recipes-kernel/lttng/lttng-modul=
es/0017-fix-random-remove-unused-tracepoints-v5.18.patch
new file mode 100644
index 0000000000..3fc7fd733d
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0017-fix-random-remove-unus=
ed-tracepoints-v5.18.patch
@@ -0,0 +1,46 @@
+From 25b70c486bb96de0caf7cea1da42ed07801cca84 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 4 Apr 2022 14:33:42 -0400
+Subject: [PATCH 17/19] fix: random: remove unused tracepoints (v5.18)
+
+See upstream commit :
+
+  commit 14c174633f349cb41ea90c2c0aaddac157012f74
+  Author: Jason A. Donenfeld <Jason@zx2c4.com>
+  Date:   Thu Feb 10 16:40:44 2022 +0100
+
+    random: remove unused tracepoints
+
+    These explicit tracepoints aren't really used and show sign of aging=
.
+    It's work to keep these up to date, and before I attempted to keep t=
hem
+    up to date, they weren't up to date, which indicates that they're no=
t
+    really used. These days there are better ways of introspecting anywa=
y.
+
+Upstream-Status: Backport [369d82bb1746447514c877088d7c5fd0f39140f8]
+Change-Id: I3b8c3e2732e7efdd76ce63204ac53a48784d0df6
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ probes/Kbuild | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/probes/Kbuild b/probes/Kbuild
+index 3ae2d39e..58da82b8 100644
+--- a/probes/Kbuild
++++ b/probes/Kbuild
+@@ -215,8 +215,11 @@ ifneq ($(CONFIG_FRAME_WARN),0)
+   CFLAGS_lttng-probe-printk.o +=3D -Wframe-larger-than=3D2200
+ endif
+=20
++# Introduced in v3.6, remove in v5.18
+ obj-$(CONFIG_LTTNG) +=3D  $(shell \
+-    if [ $(VERSION) -ge 4 \
++    if [ \( ! \( $(VERSION) -ge 6 -o \( $(VERSION) -eq 5 -a $(PATCHLEVE=
L) -ge 18 \) \) \) \
++      -a \
++      $(VERSION) -ge 4 \
+       -o \( $(VERSION) -eq 3 -a $(PATCHLEVEL) -ge 6 \) \
+       -o \( $(VERSION) -eq 3 -a $(PATCHLEVEL) -eq 5 -a $(SUBLEVEL) -ge =
2 \) \
+       -o \( $(VERSION) -eq 3 -a $(PATCHLEVEL) -eq 4 -a $(SUBLEVEL) -ge =
9 \) \
+--=20
+2.35.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0018-fix-random-remo=
ve-unused-tracepoints-v5.10-v5.15.patch b/meta/recipes-kernel/lttng/lttng=
-modules/0018-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch
new file mode 100644
index 0000000000..5c324a9bde
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0018-fix-random-remove-unus=
ed-tracepoints-v5.10-v5.15.patch
@@ -0,0 +1,45 @@
+From da956d1444139883f5d01078d945078738ffade4 Mon Sep 17 00:00:00 2001
+From: He Zhe <zhe.he@windriver.com>
+Date: Thu, 2 Jun 2022 06:36:08 +0000
+Subject: [PATCH 18/19] fix: random: remove unused tracepoints (v5.10, v5=
.15)
+
+The following kernel commit has been back ported to v5.10.119 and v5.15.=
44.
+
+commit 14c174633f349cb41ea90c2c0aaddac157012f74
+Author: Jason A. Donenfeld <Jason@zx2c4.com>
+Date:   Thu Feb 10 16:40:44 2022 +0100
+
+  random: remove unused tracepoints
+
+  These explicit tracepoints aren't really used and show sign of aging.
+  It's work to keep these up to date, and before I attempted to keep the=
m
+  up to date, they weren't up to date, which indicates that they're not
+  really used. These days there are better ways of introspecting anyway.
+
+Upstream-Status: Backport [1901e0eb58795e850e8fdcb5e1c235e4397b470d]
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Change-Id: I0b7eb8aa78b5bd2039e20ae3e1da4c5eb9018789
+---
+ probes/Kbuild | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/probes/Kbuild b/probes/Kbuild
+index 58da82b8..87f2d681 100644
+--- a/probes/Kbuild
++++ b/probes/Kbuild
+@@ -217,7 +217,10 @@ endif
+=20
+ # Introduced in v3.6, remove in v5.18
+ obj-$(CONFIG_LTTNG) +=3D  $(shell \
+-    if [ \( ! \( $(VERSION) -ge 6 -o \( $(VERSION) -eq 5 -a $(PATCHLEVE=
L) -ge 18 \) \) \) \
++    if [ \( ! \( $(VERSION) -ge 6 \
++      -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -ge 18 \) \
++      -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -eq 15 -a $(SUBLEVEL) -ge=
 44 \) \
++      -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -eq 10 -a $(SUBLEVEL) -ge=
 119\) \) \) \
+       -a \
+       $(VERSION) -ge 4 \
+       -o \( $(VERSION) -eq 3 -a $(PATCHLEVEL) -ge 6 \) \
+--=20
+2.35.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0019-fix-random-trac=
epoints-removed-in-stable-kernels.patch b/meta/recipes-kernel/lttng/lttng=
-modules/0019-fix-random-tracepoints-removed-in-stable-kernels.patch
new file mode 100644
index 0000000000..73ba4d06bc
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0019-fix-random-tracepoints=
-removed-in-stable-kernels.patch
@@ -0,0 +1,51 @@
+From 2c98e0cd03eba0aa935796bc7413c51b5e4b055c Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Tue, 31 May 2022 15:24:48 -0400
+Subject: [PATCH 19/19] fix: 'random' tracepoints removed in stable kerne=
ls
+
+The upstream commit 14c174633f349cb41ea90c2c0aaddac157012f74 removing
+the 'random' tracepoints is being backported to multiple stable kernel
+branches, I don't see how that qualifies as a fix but here we are.
+
+Use the presence of 'include/trace/events/random.h' in the kernel source
+tree instead of the rather tortuous version check to determine if we
+need to build 'lttng-probe-random.ko'.
+
+Upstream-Status: Backport [ed1149ef88fb62c365ac66cf62c58ac6abd8d7e8]
+Change-Id: I8f5f2f4c9e09c61127c49c7949b22dd3fab0460d
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ probes/Kbuild | 16 ++++------------
+ 1 file changed, 4 insertions(+), 12 deletions(-)
+
+diff --git a/probes/Kbuild b/probes/Kbuild
+index 87f2d681..f09d6b65 100644
+--- a/probes/Kbuild
++++ b/probes/Kbuild
+@@ -216,18 +216,10 @@ ifneq ($(CONFIG_FRAME_WARN),0)
+ endif
+=20
+ # Introduced in v3.6, remove in v5.18
+-obj-$(CONFIG_LTTNG) +=3D  $(shell \
+-    if [ \( ! \( $(VERSION) -ge 6 \
+-      -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -ge 18 \) \
+-      -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -eq 15 -a $(SUBLEVEL) -ge=
 44 \) \
+-      -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -eq 10 -a $(SUBLEVEL) -ge=
 119\) \) \) \
+-      -a \
+-      $(VERSION) -ge 4 \
+-      -o \( $(VERSION) -eq 3 -a $(PATCHLEVEL) -ge 6 \) \
+-      -o \( $(VERSION) -eq 3 -a $(PATCHLEVEL) -eq 5 -a $(SUBLEVEL) -ge =
2 \) \
+-      -o \( $(VERSION) -eq 3 -a $(PATCHLEVEL) -eq 4 -a $(SUBLEVEL) -ge =
9 \) \
+-      -o \( $(VERSION) -eq 3 -a $(PATCHLEVEL) -eq 0 -a $(SUBLEVEL) -ge =
41 \) ] ; then \
+-      echo "lttng-probe-random.o" ; fi;)
++random_dep =3D $(srctree)/include/trace/events/random.h
++ifneq ($(wildcard $(random_dep)),)
++  obj-$(CONFIG_LTTNG) +=3D lttng-probe-random.o
++endif
+=20
+ obj-$(CONFIG_LTTNG) +=3D  $(shell \
+   if [ $(VERSION) -ge 4 \
+--=20
+2.35.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb b/meta/rec=
ipes-kernel/lttng/lttng-modules_2.11.6.bb
index 3145f0298c..76b9f13618 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.11.6.bb
@@ -28,6 +28,9 @@ SRC_URI =3D "https://lttng.org/files/${BPN}/${BPN}-${PV=
}.tar.bz2 \
            file://0014-Revert-fix-include-order-for-older-kernels.patch =
\
            file://0015-fix-backport-of-fix-tracepoint-Optimize-using-sta=
tic.patch \
            file://0016-fix-adjust-version-range-for-trace_find_free_exte=
nt.patch \
+           file://0017-fix-random-remove-unused-tracepoints-v5.18.patch =
\
+           file://0018-fix-random-remove-unused-tracepoints-v5.10-v5.15.=
patch \
+           file://0019-fix-random-tracepoints-removed-in-stable-kernels.=
patch \
            "
=20
 SRC_URI[md5sum] =3D "8ef09fdfcdec669d33f7fc1c1c80f2c4"
--=20
2.35.1


