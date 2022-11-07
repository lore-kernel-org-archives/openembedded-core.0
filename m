Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B33EC433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 18:02:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1108.1667844128410901194
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 10:02:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 055AC1FB;
	Mon,  7 Nov 2022 10:02:14 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6891D3F534;
	Mon,  7 Nov 2022 10:02:07 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH][langdale 1/2] pixman: backport fix for CVE-2022-44638
Date: Mon,  7 Nov 2022 18:02:04 +0000
Message-Id: <20221107180205.2838225-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 18:02:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172926

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../xorg-lib/pixman/CVE-2022-44638.patch      | 33 +++++++++++++++++++
 .../xorg-lib/pixman_0.40.0.bb                 |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.=
patch

diff --git a/meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch b=
/meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch
new file mode 100644
index 00000000000..d226766d49a
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch
@@ -0,0 +1,33 @@
+CVE: CVE-2022-44638
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From a1f88e842e0216a5b4df1ab023caebe33c101395 Mon Sep 17 00:00:00 2001
+From: Matt Turner <mattst88@gmail.com>
+Date: Wed, 2 Nov 2022 12:07:32 -0400
+Subject: [PATCH] Avoid integer overflow leading to out-of-bounds write
+
+Thanks to Maddie Stone and Google's Project Zero for discovering this
+issue, providing a proof-of-concept, and a great analysis.
+
+Closes: https://gitlab.freedesktop.org/pixman/pixman/-/issues/63
+---
+ pixman/pixman-trap.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pixman/pixman-trap.c b/pixman/pixman-trap.c
+index 91766fd..7560405 100644
+--- a/pixman/pixman-trap.c
++++ b/pixman/pixman-trap.c
+@@ -74,7 +74,7 @@ pixman_sample_floor_y (pixman_fixed_t y,
+=20
+     if (f < Y_FRAC_FIRST (n))
+     {
+-	if (pixman_fixed_to_int (i) =3D=3D 0x8000)
++	if (pixman_fixed_to_int (i) =3D=3D 0xffff8000)
+ 	{
+ 	    f =3D 0; /* saturate */
+ 	}
+--=20
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb b/meta/recip=
es-graphics/xorg-lib/pixman_0.40.0.bb
index ccfe2777466..c56733eefd6 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
@@ -9,6 +9,7 @@ DEPENDS =3D "zlib"
=20
 SRC_URI =3D "https://www.cairographics.org/releases/${BP}.tar.gz \
            file://0001-ARM-qemu-related-workarounds-in-cpu-features-dete=
cti.patch \
+           file://CVE-2022-44638.patch \
            "
 SRC_URI[md5sum] =3D "73858c0862dd9896fb5f62ae267084a4"
 SRC_URI[sha256sum] =3D "6d200dec3740d9ec4ec8d1180e25779c00bc749f94278c8b=
9021f5534db223fc"
--=20
2.34.1


