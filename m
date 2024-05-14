Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3285C41513
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 16:15:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20270.1715703326476720739
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 May 2024 09:15:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 208401007
	for <openembedded-core@lists.openembedded.org>; Tue, 14 May 2024 09:15:51 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DE9323F641
	for <openembedded-core@lists.openembedded.org>; Tue, 14 May 2024 09:15:25 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/3] oeqa/selftest/debuginfod: use localpkgfeed to speed server startup
Date: Tue, 14 May 2024 16:15:21 +0000
Message-Id: <20240514161521.4082896-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240514161521.4082896-1-ross.burton@arm.com>
References: <20240514161521.4082896-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 May 2024 16:15:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199267

Sometimes the debuginfod selftest fails due to a timeout, because it
spends too long scanning a huge deploy directory that due to what tests
were ran previously can contain 30K packages.

The test only needs a subset of the feed, so use the new localpkgfeed
class to construct a minimal feed before running the test.

[ YOCTO #14937 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/debuginfod.py | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/debuginfod.py b/meta/lib/oeqa/s=
elftest/cases/debuginfod.py
index 505b4be8373..46c0cd87bbc 100644
--- a/meta/lib/oeqa/selftest/cases/debuginfod.py
+++ b/meta/lib/oeqa/selftest/cases/debuginfod.py
@@ -62,7 +62,7 @@ class Debuginfod(OESelftestTestCase):
=20
         raise TimeoutError("Cannot connect debuginfod, still %d scan job=
s running" % latest)
=20
-    def start_debuginfod(self):
+    def start_debuginfod(self, feed_dir):
         # We assume that the caller has already bitbake'd elfutils-nativ=
e:do_addto_recipe_sysroot
=20
         # Save some useful paths for later
@@ -82,7 +82,7 @@ class Debuginfod(OESelftestTestCase):
             # Disable rescanning, this is a one-shot test
             "--rescan-time=3D0",
             "--groom-time=3D0",
-            get_bb_var("DEPLOY_DIR"),
+            feed_dir,
         ]
=20
         format =3D get_bb_var("PACKAGE_CLASSES").split()[0]
@@ -114,11 +114,12 @@ class Debuginfod(OESelftestTestCase):
         self.write_config("""
 TMPDIR =3D "${TOPDIR}/tmp-debuginfod"
 DISTRO_FEATURES:append =3D " debuginfod"
+INHERIT +=3D "localpkgfeed"
 """)
-        bitbake("elfutils-native:do_addto_recipe_sysroot xz xz:do_packag=
e")
+        bitbake("elfutils-native:do_addto_recipe_sysroot xz xz:do_packag=
e xz:do_localpkgfeed")
=20
         try:
-            self.start_debuginfod()
+            self.start_debuginfod(get_bb_var("LOCALPKGFEED_DIR", "xz"))
=20
             env =3D os.environ.copy()
             env["DEBUGINFOD_URLS"] =3D "http://localhost:%d/" % self.por=
t
@@ -141,12 +142,13 @@ DISTRO_FEATURES:append =3D " debuginfod"
         self.write_config("""
 TMPDIR =3D "${TOPDIR}/tmp-debuginfod"
 DISTRO_FEATURES:append =3D " debuginfod"
+INHERIT +=3D "localpkgfeed"
 CORE_IMAGE_EXTRA_INSTALL +=3D "elfutils xz"
         """)
-        bitbake("core-image-minimal elfutils-native:do_addto_recipe_sysr=
oot")
+        bitbake("core-image-minimal elfutils-native:do_addto_recipe_sysr=
oot xz:do_localpkgfeed")
=20
         try:
-            self.start_debuginfod()
+            self.start_debuginfod(get_bb_var("LOCALPKGFEED_DIR", "xz"))
=20
             with runqemu("core-image-minimal", runqemuparams=3D"nographi=
c") as qemu:
                 cmd =3D "DEBUGINFOD_URLS=3Dhttp://%s:%d/ debuginfod-find=
 debuginfo /usr/bin/xz" % (qemu.server_ip, self.port)
--=20
2.34.1


