Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0477E77180
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 17:19:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.25020.1734023932774119193
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 09:18:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E6191762
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 09:19:20 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DAF723F58B
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 09:18:51 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pixman: remove long-obsolete patch
Date: Thu, 12 Dec 2024 17:18:42 +0000
Message-ID: <20241212171844.2669396-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 17:19:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208659

This patch from the Nokia/Scratchbox days[1] was obsoleted by qemu
improvements, specifically "linux-user: fake /proc/self/auxv"[2] which
was integrated into qemu 1.1.0 in 2011.

[1] If you're reading this and reminiscing I suggest standing up and
having a stretch, your back will thank you
[2] 257450ee59fd7e781cb4e2316ddc845c40b9fc42

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-workarounds-in-cpu-features-detecti.patch | 135 ------------------
 .../xorg-lib/pixman_0.44.2.bb                 |   4 +-
 2 files changed, 1 insertion(+), 138 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-ARM-qemu-r=
elated-workarounds-in-cpu-features-detecti.patch

diff --git a/meta/recipes-graphics/xorg-lib/pixman/0001-ARM-qemu-related-=
workarounds-in-cpu-features-detecti.patch b/meta/recipes-graphics/xorg-li=
b/pixman/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
deleted file mode 100644
index 35faafea5b4..00000000000
--- a/meta/recipes-graphics/xorg-lib/pixman/0001-ARM-qemu-related-workaro=
unds-in-cpu-features-detecti.patch
+++ /dev/null
@@ -1,135 +0,0 @@
-From 0beed8c190b27a07e7f1145a46a7ca8a75864263 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
-Date: Thu, 23 Aug 2012 18:10:57 +0200
-Subject: [PATCH] ARM: qemu related workarounds in cpu features detection=
 code
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-This was ported from meta-oe's patch [1]. The original pixman patch is f=
ound
-at [2].
-
-[1] http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-=
graphics/xorg-lib/pixman-0.26.2/0001-ARM-qemu-related-workarounds-in-cpu-=
features-detecti.patch
-[2] http://lists.freedesktop.org/archives/pixman/2011-January/000906.htm=
l
-
-Upstream-Status: Inappropriate [other] qemu fix
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
----
- pixman/pixman-arm.c | 77 ++++++++++++++++++++++++++++++++++++---------
- 1 file changed, 62 insertions(+), 15 deletions(-)
-
-diff --git a/pixman/pixman-arm.c b/pixman/pixman-arm.c
-index d271e96..8f6e241 100644
---- a/pixman/pixman-arm.c
-+++ b/pixman/pixman-arm.c
-@@ -128,16 +128,34 @@ detect_cpu_features (void)
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <sys/mman.h>
-+#include <sys/utsname.h>
- #include <fcntl.h>
- #include <string.h>
- #include <elf.h>
-=20
-+/*
-+ * The whole CPU capabilities detection is a bit ugly: when running in
-+ * userspace qemu, we see /proc/self/auxv from the host system. To make
-+ * everything even worse, the size of each value is 64-bit when running
-+ * on a 64-bit host system. So the data is totally bogus because we exp=
ect
-+ * 32-bit values. As AT_PLATFORM value is used as a pointer, it may cau=
se
-+ * segfault (null pointer dereference on x86-64 host). So in order to b=
e
-+ * on a safe side, we require that AT_PLATFORM value is found only once=
,
-+ * and it has non-zero value (this is still not totally reliable for a =
big
-+ * endian 64-bit host system running qemu and may theoretically fail).
-+ */
-+#define ARM_HWCAP_VFP 64
-+#define ARM_HWCAP_NEON 4096
-+
- static arm_cpu_features_t
- detect_cpu_features (void)
- {
-     arm_cpu_features_t features =3D 0;
-     Elf32_auxv_t aux;
-     int fd;
-+    uint32_t hwcap =3D 0;
-+    const char *plat =3D NULL;
-+    int plat_cnt =3D 0;
-=20
-     fd =3D open ("/proc/self/auxv", O_RDONLY);
-     if (fd >=3D 0)
-@@ -146,30 +164,59 @@ detect_cpu_features (void)
- 	{
- 	    if (aux.a_type =3D=3D AT_HWCAP)
- 	    {
--		uint32_t hwcap =3D aux.a_un.a_val;
--
--		/* hardcode these values to avoid depending on specific
--		 * versions of the hwcap header, e.g. HWCAP_NEON
--		 */
--		if ((hwcap & 64) !=3D 0)
--		    features |=3D ARM_VFP;
--		/* this flag is only present on kernel 2.6.29 */
--		if ((hwcap & 4096) !=3D 0)
--		    features |=3D ARM_NEON;
-+		hwcap =3D aux.a_un.a_val;
- 	    }
- 	    else if (aux.a_type =3D=3D AT_PLATFORM)
- 	    {
--		const char *plat =3D (const char*) aux.a_un.a_val;
--
--		if (strncmp (plat, "v7l", 3) =3D=3D 0)
-+		plat =3D (const char*) aux.a_un.a_val;
-+		plat_cnt++;
-+	    }
-+	}
-+	close (fd);
-+	if (plat =3D=3D NULL || plat_cnt !=3D 1 || *plat !=3D 'v')
-+	{
-+	    /*
-+	     * Something seems to be really wrong, most likely we are
-+	     * running under qemu. Let's use machine type from "uname" for
-+	     * CPU capabilities detection:
-+	     * http://www.mail-archive.com/qemu-devel at nongnu.org/msg22212.h=
tml
-+	     */
-+	    struct utsname u;
-+	    hwcap =3D 0; /* clear hwcap, because it is bogus */
-+	    if (uname (&u) =3D=3D 0)
-+	    {
-+		if (strcmp (u.machine, "armv7l") =3D=3D 0)
-+		{
- 		    features |=3D (ARM_V7 | ARM_V6);
--		else if (strncmp (plat, "v6l", 3) =3D=3D 0)
-+		    hwcap |=3D ARM_HWCAP_VFP;  /* qemu is supposed to emulate vfp */
-+		    hwcap |=3D ARM_HWCAP_NEON; /* qemu is supposed to emulate neon */
-+		}
-+		else if (strcmp (u.machine, "armv6l") =3D=3D 0)
-+		{
- 		    features |=3D ARM_V6;
-+		    hwcap |=3D ARM_HWCAP_VFP;  /* qemu is supposed to emulate vfp */
-+		}
- 	    }
- 	}
--	close (fd);
-+	else if (strncmp (plat, "v7l", 3) =3D=3D 0)
-+	{
-+	    features |=3D (ARM_V7 | ARM_V6);
-+	}
-+	else if (strncmp (plat, "v6l", 3) =3D=3D 0)
-+	{
-+	    features |=3D ARM_V6;
-+	}
-     }
-=20
-+    /* hardcode these values to avoid depending on specific
-+     * versions of the hwcap header, e.g. HWCAP_NEON
-+     */
-+    if ((hwcap & ARM_HWCAP_VFP) !=3D 0)
-+        features |=3D ARM_VFP;
-+    /* this flag is only present on kernel 2.6.29 */
-+    if ((hwcap & ARM_HWCAP_NEON) !=3D 0)
-+        features |=3D ARM_NEON;
-+
-     return features;
- }
-=20
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb b/meta/recip=
es-graphics/xorg-lib/pixman_0.44.2.bb
index 9e2a102a9b1..2e5bb172f57 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb
@@ -7,9 +7,7 @@ HOMEPAGE =3D "http://www.pixman.org"
 SECTION =3D "x11/libs"
 DEPENDS =3D "zlib"
=20
-SRC_URI =3D "https://www.cairographics.org/releases/${BP}.tar.gz \
-           file://0001-ARM-qemu-related-workarounds-in-cpu-features-dete=
cti.patch \
-           "
+SRC_URI =3D "https://www.cairographics.org/releases/${BP}.tar.gz"
 SRC_URI[sha256sum] =3D "6349061ce1a338ab6952b92194d1b0377472244208d47ff2=
5bef86fc71973466"
=20
 # see http://cairographics.org/releases/ - only even minor versions are =
stable
--=20
2.43.0


