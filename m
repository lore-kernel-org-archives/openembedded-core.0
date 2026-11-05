Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3206.1793903468924782025
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 10:31:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=mxYYP8Cz;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0AF5F168F
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Nov 2026 10:31:05 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B624B3F632
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Nov 2026 10:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793903468; bh=QbSDPtLiyTZMKHxHmBUPTxqCyNflend1c+M8uLW/vBs=;
	h=From:To:Subject:Date:From;
	b=mxYYP8CzIGKMebsUD82NIBkUCVGftSTQn6Tvwj4Ilix9KO5uP9EmyMKXpf+NgVmES
	 1FRqJCl4RQOZPdESx0PB8bMw+eI+sddI4nIJ2SbEx7ivlHF2TaXpsd79G8vuBZ9Vsf
	 tI2vWpJOCw1ZqyoJIAU0IEGEvQr3Z8HuqvrxPPRw=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pango: refresh upstreamed patch
Date: Thu,  5 Nov 2026 18:31:04 +0000
Message-ID: <20261105183104.23197-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 18:31:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249569
Content-Type: text/plain; charset="utf-8"

To make this disappear on the upgrade, update the patch to be a backport.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...ror-on-clang-s-unused-but-set-global.patch | 35 +++++++++++--------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-graphics/pango/pango/0001-meson-don-t-error-on-=
clang-s-unused-but-set-global.patch b/meta/recipes-graphics/pango/pango/0=
001-meson-don-t-error-on-clang-s-unused-but-set-global.patch
index 2c3788abdf2..66c5b331c33 100644
--- a/meta/recipes-graphics/pango/pango/0001-meson-don-t-error-on-clang-s=
-unused-but-set-global.patch
+++ b/meta/recipes-graphics/pango/pango/0001-meson-don-t-error-on-clang-s=
-unused-but-set-global.patch
@@ -1,28 +1,33 @@
-From: Sunil Dora <sunilkumar.dora@windriver.com>
-Date: Wed, 20 Aug 2026 10:45:00 +0530
-Subject: [PATCH] meson: don't error on clang's -Wunused-but-set-global
+From 919d0b32c02a7d0aa9739473349c73ac5f63ec10 Mon Sep 17 00:00:00 2001
+From: Matthias Clasen <mclasen@redhat.com>
+Date: Thu, 5 Nov 2026 11:40:45 -0500
+Subject: [PATCH] build: Don't promote unused globals to errors with clan=
g
=20
-clang 23 added -Wunused-but-set-global to the -Wunused-but-set-variable
-group, so the -Werror=3Dunused-but-set-variable in test_cflags now turns
-it into an error. It fires on the <type>_parent_class variables that
-GLib's G_DEFINE_TYPE family of macros emit, which pango cannot fix, and
-on a few deliberately write-only globals in the test suite.
+Clang 23 includes -Wunused-but-set-global in -Wunused-but-set-variable.
+GLib type macros create parent-class globals that are legitimately unuse=
d
+in some types, so Pango fails when the latter warning group is promoted
+to an error. Keep the warning visible but do not make its global variant
+fatal.
=20
-Keep the warning visible but not fatal. gcc does not know this warning
-group, so cc.get_supported_arguments() drops the flag there.
+Based on a patch by David Nylander (!927).
=20
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/pango/-/issue=
s/900]
-Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/pango/-/issues=
/900]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
 ---
+ meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/meson.build b/meson.build
+index 9a5dc9ed1..58faa8496 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -148,6 +148,9 @@
+@@ -148,6 +148,7 @@ elif cc.get_id() =3D=3D 'gcc' or cc.get_id() =3D=3D =
'clang'
      '-Werror=3Dempty-body',
      '-Werror=3Dwrite-strings',
      '-Werror=3Dunused-but-set-variable',
-+    # clang 23 made this part of the group above; it fires on GLib's
-+    # G_DEFINE_TYPE boilerplate, which pango cannot fix.
 +    '-Wno-error=3Dunused-but-set-global',
      '-Wundef', # FIXME: https://bugzilla.gnome.org/show_bug.cgi?id=3D79=
2481
    ]
 =20
+--=20
+GitLab
--=20
2.43.0

