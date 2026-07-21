Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C34C44536
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 16:15:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26890.1784650521664290077
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 09:15:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=jzQRrvSr;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02A551595
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 09:15:17 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DADC43F86F
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 09:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784650521; bh=P0uU/Mupud6RzHFbO9W2TG/YF/NmDpoTg03koJKYD3w=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jzQRrvSrdJ1X2FecavtHaRxb9uV6FYgtqbuX3Rk4x773VoHnYqrbu6MsSMztA4EjQ
	 lZzThhUkzw9MCDJA+e6nM3m9pYVqmcwyN213fot/NxPW2oOvP5pwJ8jkZdCVbuf/ud
	 Ikl+gI/Qysv+BX/ZYXH/ACFxi0PijZlKPOYJHU6s=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] systemd-tools-native: add systemd-hwdb
Date: Tue, 21 Jul 2026 17:15:10 +0100
Message-ID: <20260721161511.2946619-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721161511.2946619-1-ross.burton@arm.com>
References: <20260721161511.2946619-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 16:15:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241555

Also build systemd-hwdb so that we can generate hwdb.bin at rootfs time
with native code instead of using qemu-user. I've verified that the
hwdb.bin format is word-size and endian agnosic, so we don't need to use
qemu.

Add a patch so that source file names in the hwdb.bin have the rootfs
prefix stripped, so that build paths don't appear in the final image.

This does mean we have to hardcode prefix=3D/usr sysconfdir=3D/etc as the
target paths, but systemd effectively mandates these so hopefully this
is not a problem in the real world.

Partially based on work by Daniel Turull.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../systemd/systemd-tools-native_259.5.bb     | 27 +++++++++----
 ...oot-from-filenames-when-generating-h.patch | 40 +++++++++++++++++++
 2 files changed, 60 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-hwdb-strip-the=
-root-from-filenames-when-generating-h.patch

diff --git a/meta/recipes-core/systemd/systemd-tools-native_259.5.bb b/me=
ta/recipes-core/systemd/systemd-tools-native_259.5.bb
index d25e36ff3c0..744e874a1a2 100644
--- a/meta/recipes-core/systemd/systemd-tools-native_259.5.bb
+++ b/meta/recipes-core/systemd/systemd-tools-native_259.5.bb
@@ -4,6 +4,8 @@ require systemd.inc
=20
 SUMMARY =3D "native tools from systemd"
=20
+SRC_URI +=3D "file://0001-hwdb-strip-the-root-from-filenames-when-genera=
ting-h.patch"
+
 # We don't actually need jinja to generate code, but it's checked for at=
 configure time
 DEPENDS =3D "gperf-native python3-jinja2-native"
=20
@@ -12,16 +14,27 @@ inherit pkgconfig meson native
 # Disable everything that is auto-detected by default
 EXTRA_OEMESON +=3D "--auto-features disabled"
=20
-# Link systemctl statically
-EXTRA_OEMESON +=3D "-Dlink-systemctl-shared=3Dfalse"
+# Link the binaries statically as we don't install libsystemd-shared.so
+EXTRA_OEMESON +=3D "-Dlink-systemctl-shared=3Dfalse -Dlink-udev-shared=3D=
false"
=20
 # Ensure unused build paths are not in the binary
 EXTRA_OEMESON +=3D "-Dsysvinit-path=3D -Dsysvrcnd-path=3D"
=20
-# Systemctl is supposed to operate on target, but the target sysroot is =
not
-# determined at run-time, but rather set during configure
-# More details are here https://github.com/systemd/systemd/issues/35897#=
issuecomment-2665405887
-EXTRA_OEMESON +=3D "--sysconfdir ${sysconfdir_native}"
+# Target-absolute paths that satisfy both tools from one meson configure=
:
+#  - systemd-hwdb needs prefix=3D/usr so the compiled-in UDEVLIBEXECDIR
+#    (/usr/lib/udev) matches the target rootfs layout, letting
+#    "update --root $D --usr" find hwdb.d sources and write hwdb.bin the=
re.
+#  - systemctl needs sysconfdir=3D/etc; it operates on the target rootfs=
 but the
+#    sysroot is fixed at configure time rather than run time.
+#    See https://github.com/systemd/systemd/issues/35897#issuecomment-26=
65405887
+EXTRA_OEMESON +=3D "--prefix /usr --sysconfdir /etc"
+# TODO libdir?
=20
-MESON_TARGET =3D "systemctl"
+MESON_TARGET =3D "systemctl systemd-hwdb"
 MESON_INSTALL_TAGS =3D "systemctl"
+
+do_install:append() {
+    # Can't install this with a tag "hwdb" also tries to install the hwd=
b
+    # itself, and there's no separate tag for systemd-hwdb.
+    install ${B}/systemd-hwdb ${D}${bindir}/systemd-hwdb
+}
diff --git a/meta/recipes-core/systemd/systemd/0001-hwdb-strip-the-root-f=
rom-filenames-when-generating-h.patch b/meta/recipes-core/systemd/systemd=
/0001-hwdb-strip-the-root-from-filenames-when-generating-h.patch
new file mode 100644
index 00000000000..f11199c553b
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-hwdb-strip-the-root-from-fil=
enames-when-generating-h.patch
@@ -0,0 +1,40 @@
+From 0031715c560e8138cc320f017a0a2c7160b1f7fe Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Fri, 17 Jul 2026 17:25:31 +0100
+Subject: [PATCH] hwdb: strip the root from filenames when generating hwd=
b.bin
+
+The modern hwdb.bin format contains the filenames of the input data that
+makes up the database.  This is useful but in offline builds where
+--root is used, the filenames are the full build paths including the
+specified root.  This introduces build paths and thus information
+leakage and non-reproducible data.
+
+Solve this by stripping the root prefix off the original path when
+passing to import_file.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/43062=
]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/shared/hwdb-util.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/shared/hwdb-util.c b/src/shared/hwdb-util.c
+index b42681a289..5386b4e9f4 100644
+--- a/src/shared/hwdb-util.c
++++ b/src/shared/hwdb-util.c
+@@ -632,9 +632,11 @@ int hwdb_update(const char *root, const char *hwdb_=
bin_dir, bool strict, bool co
+=20
+         FOREACH_ARRAY(i, files, n_files) {
+                 ConfFile *c =3D *i;
++                char *path_in_root;
+=20
+                 log_debug("Reading file \"%s\" -> \"%s\"", c->original_=
path, c->resolved_path);
+-                RET_GATHER(ret, import_file(trie, c->fd, c->original_pa=
th, file_priority++, compat));
++                path_in_root =3D path_startswith_full(c->original_path,=
 empty_to_root(root), PATH_STARTSWITH_RETURN_LEADING_SLASH);
++                RET_GATHER(ret, import_file(trie, c->fd, path_in_root, =
file_priority++, compat));
+         }
+=20
+         strbuf_complete(trie->strings);
+--=20
+2.43.0
+
--=20
2.43.0


