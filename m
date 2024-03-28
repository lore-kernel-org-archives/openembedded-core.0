Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A24D9CD11DD
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 16:44:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1405.1711644266122836575
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 09:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25D061476
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 09:44:59 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 55A443F694
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 09:44:25 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glib-2.0: skip a timing sensitive ptest
Date: Thu, 28 Mar 2024 16:44:23 +0000
Message-Id: <20240328164423.2416345-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 16:44:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197594

From: Ross Burton <ross.burton@arm.com>

The /timeout/rounding test is sensitive to system load, as it expects
timeouts to trigger in windows that on an idle system are realistic but
not when running inside a qemu-system on a loaded system.

[ YOCTO #14464 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../glib-2.0/glib-2.0/skip-timeout.patch      | 32 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/skip-timeout.patc=
h

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/skip-timeout.patch b/met=
a/recipes-core/glib-2.0/glib-2.0/skip-timeout.patch
new file mode 100644
index 00000000000..cd5ac287c3f
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/skip-timeout.patch
@@ -0,0 +1,32 @@
+From bb11d1a4ae77d93ec0743e54077cf0f990243fa6 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 28 Mar 2024 16:27:09 +0000
+Subject: [PATCH] Skip /timeout/rounding test
+
+This test is sensitive to load because it expects certain timeout operat=
ions
+to succeed in specific time periods. Whilst these timeouts are fairly la=
rge,
+they're still exceeded inside a qemu on a loaded system.
+
+https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14464
+
+Upstream-Status: Inappropriate [OE-specific]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ glib/tests/timeout.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/glib/tests/timeout.c b/glib/tests/timeout.c
+index 1ae3f3a34..85a715b0f 100644
+--- a/glib/tests/timeout.c
++++ b/glib/tests/timeout.c
+@@ -214,7 +214,6 @@ main (int argc, char *argv[])
+   g_test_add_func ("/timeout/seconds-once", test_seconds_once);
+   g_test_add_func ("/timeout/weeks-overflow", test_weeks_overflow);
+   g_test_add_func ("/timeout/far-future-ready-time", test_far_future_re=
ady_time);
+-  g_test_add_func ("/timeout/rounding", test_rounding);
+=20
+   return g_test_run ();
+ }
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.78.4.bb
index f0fd057be70..b1669ead75e 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV=
}.tar.xz \
            file://0001-Switch-from-the-deprecated-distutils-module-to-th=
e-p.patch \
            file://memory-monitor.patch \
            file://fix-regex.patch \
+           file://skip-timeout.patch \
            "
 SRC_URI:append:class-native =3D " file://relocate-modules.patch \=20
                                 file://0001-meson.build-do-not-enable-pi=
dfd-features-on-native-g.patch \
--=20
2.34.1


