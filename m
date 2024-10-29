Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 367B2D3A670
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 16:16:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.592.1730218564341799441
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 09:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7996497
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 09:16:33 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9A9A23F73B
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 09:16:03 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH] systemd: extract dependencies from .note.dlopen ELF segments
Date: Tue, 29 Oct 2024 16:16:00 +0000
Message-Id: <20241029161600.2662258-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 16:16:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206507

First, this is likely not the final implementation, but a RFC and
prototype.

Some binaries don't dynamically link to libraries, but instead at runtime
dlopen() them. This means extra work for distributions as the dependencie=
s
are not detected automatically, so libraries may be missing.

systemd is one such project which does this, and in an attempt to solve
the packaging problem it also embeds the names of the libraries that can
potentially be opened at runtime into ELF notes.  These can be read to
generate package dependencies.  For example:

packages/cortexa57-poky-linux/systemd/libsystemd-shared: RRECOMMENDS: add=
ed "libkmod (['>=3D 33']) libzstd (['>=3D 1.5.6'])"
packages/cortexa57-poky-linux/systemd/libsystemd: RRECOMMENDS: added "lib=
zstd (['>=3D 1.5.6'])"

I expect this code to be changed before merging. Whilst systemd is the
main user of his approach right now, I expect to see it used in more
places in the future so there's a reasonably good argument to merge it
into the core shlibs code.  Also it currently manually extracts and
parses the data, whereas maybe we should incorporate pyelftools into
meta/lib/oe and use that to parse ELF files across all of OE.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/systemd/dlopen-deps.inc  | 73 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_256.7.bb |  2 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-core/systemd/dlopen-deps.inc

diff --git a/meta/recipes-core/systemd/dlopen-deps.inc b/meta/recipes-cor=
e/systemd/dlopen-deps.inc
new file mode 100644
index 00000000000..eaf6ca1f79a
--- /dev/null
+++ b/meta/recipes-core/systemd/dlopen-deps.inc
@@ -0,0 +1,73 @@
+PACKAGEFUNCS =3D+ "package_generate_dlopen_deps"
+
+python package_generate_dlopen_deps() {
+    # https://systemd.io/ELF_DLOPEN_METADATA/
+
+    import struct, json
+
+    def extract_segment(filename, segment):
+        """
+        Return the named segment from the ELF.
+        """
+        import tempfile, subprocess
+
+        with tempfile.NamedTemporaryFile() as f:
+            cmd =3D [d.getVar("OBJCOPY"), "--dump-section", f"{segment}=3D=
{f.name}", filename]
+            subprocess.run(cmd, check=3DTrue)
+            return f.read()
+
+    def parse(buffer, is_little):
+        deps =3D []
+        offset =3D 0
+        while offset < len(buffer):
+            format =3D f"{'<' if is_little else '>'}iii"
+            name_size, desc_size, note_type =3D struct.unpack_from(forma=
t, buffer, offset)
+            offset +=3D struct.calcsize(format)
+
+            format =3D f"{name_size}s0i{desc_size}s0i"
+            if note_type =3D=3D 0x407c0c0a:
+                name_b, desc_b =3D struct.unpack_from(format, buffer, of=
fset)
+                name =3D name_b.strip(b"\x00").decode("ascii")
+                if name =3D=3D "FDO":
+                    desc =3D desc_b.strip(b"\x00").decode("utf-8")
+                    deps.append(*json.loads(desc))
+            offset +=3D struct.calcsize(format)
+        return deps
+
+    dep_map =3D {
+        "required": "RDEPENDS",
+        "recommended": "RRECOMMENDS",
+        "suggested": "RSUGGESTS"
+    }
+
+    shlibs =3D oe.package.read_shlib_providers(d)
+
+    for pkg, files in pkgfiles.items():
+        # Skip -dbg packages as we won't need to generate dependencies f=
or those
+        # but scanning can take time
+        if pkg.endswith("-dbg"):
+            continue
+
+        for f in files:
+            # Skip symlinks, just look for real libraries
+            if cpath.islink(f):
+                continue
+
+            if ".so." in f or f.endswith(".so"):
+                try:
+                    elf =3D oe.qa.ELFFile(f)
+                    elf.open()
+                    for dep in parse(extract_segment(f, ".note.dlopen"),=
 elf.isLittleEndian()):
+                        for soname in dep["soname"]:
+                            if soname in shlibs:
+                                # TODO assumes the first match is good
+                                package, version =3D list(shlibs[soname]=
.values())[0]
+                                dependency =3D dep_map[dep["priority"]]
+                                bb.note(f"{pkg}: adding {dependency} on =
{package} via .note.dlopen")
+                                d.appendVar(f"{dependency}:{pkg}", f" {p=
ackage} (>=3D {version})")
+                            else:
+                                bb.warn(f"cannot find {soname}")
+                except oe.qa.NotELFFileError as e:
+                    bb.note(f"Cannot extract ELF notes: {e}")
+                    pass
+}
diff --git a/meta/recipes-core/systemd/systemd_256.7.bb b/meta/recipes-co=
re/systemd/systemd_256.7.bb
index af810c0fcd9..faee152b306 100644
--- a/meta/recipes-core/systemd/systemd_256.7.bb
+++ b/meta/recipes-core/systemd/systemd_256.7.bb
@@ -909,3 +909,5 @@ pkg_postinst:udev-hwdb () {
 pkg_prerm:udev-hwdb () {
 	rm -f $D${sysconfdir}/udev/hwdb.bin
 }
+
+require dlopen-deps.inc
--=20
2.34.1


