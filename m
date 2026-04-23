Return-Path: <Jhonata.poma@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DC96F99370
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 11:30:44 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17259.1776943834129920734
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 04:30:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AxUkfIlV;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: jhonata.poma@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9c3e2cf3c0so1162672166b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 04:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776943832; x=1777548632; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ttEHq42xDRNVfGdQz71RbOK/la+GKgMqoTc7Fql+sYc=;
        b=AxUkfIlV5+PSL+KBcNfgib/WGfGPXeRimJtu1KPYtJbN0S0BXTd9QafaJN1ur14kcs
         jPka6hdJffXUO4nQuUkHbA0P2NiNNVLIyiXLCDZ/PAkUiE8WS6BqbiB+ZHssoMx3HL3Y
         nF7Tx9ICBFMimk1y7GobD2pcAPBv+V7k/nZm5ft9I5vgP0TbxGHUwtrGCzFjZFtcFFSh
         MNGbxcBOeUWXQK7g5VlKmCPQ7Hh5yATNeArSH2wGZTdyI3OSWMrJwY2syOoHMrs1pXW8
         41xVTAK1dNM8vD4kU7a1GM2Aj1jkPiDlRzDsRT8E8JL7TMGueK6+nDmVMz+KropC1MO1
         bQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776943832; x=1777548632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttEHq42xDRNVfGdQz71RbOK/la+GKgMqoTc7Fql+sYc=;
        b=bH0B6I7qwROl5xm07AhGjgHAQ8NNJyCwrHgb1aJhBVkXXAZk8HvExo3CHAaOSHkElm
         iV1sVdxCSlVBL2leN0jcM4TqGa4nnSGlQPymauFnFfjiVHnZaLxOxeKYMhMzFWfq/JMi
         0rfq9JScATQ+sIDpqn8dH4f7Jvvk2M+IZXx/+odU3UhDmXu1xxx7nEpRelcLReMyymJd
         tzidMkPOcBVpLKnwj5v7P2NASCY1/p9ts8D5AVZ3zgo7HoTzChv9hPRi+ocjlMo0qDv1
         nGeJqSw3l/4ezcefNMYR1TKEPZv+23vpGvn34DDASbE4OQ7TCEd7lC5yjwCRX5qkc3YB
         TN2Q==
X-Gm-Message-State: AOJu0YzJm1dtvLhy7ZVBKoc3L9B0spYBn7G1oY/DQL3ZIeA6ChSy3oKE
	22dtRZAOX/k6TYTbdsih7juHz8f0+NIrU5PutypVspxXvG+WooXUaC7hnLhOu3qi
X-Gm-Gg: AeBDietHSCSLtSNW2ouiFOwzTAOb5vnlRQvOZLS+GJjdRnSB78hbSAWRP9xdbt9c4P2
	PPi0ze+WCSdJnCXk7gQq78Qwr8TBTxnxILOMd88OBnvEH1yDGsGf+WQ0YCVWHZ5xEaEF/T6PB5R
	S0VUAw9LfdUYa3nhD5+4g7qAWVdPd/qe9dQP4qYdujrjnQFyiz+kEPujb1FcDLOeQjjCLKLe0Gc
	1vEXpJJf2Ihlpm6hMNr5l3oPTa6U2ZO6w9Ay5/FAC3571IhB0hAeJngW4CBa+/DbI61DlCUG4pW
	pqu5JHS/HAD+B84QZ7LhHS2+nJ3WmfpX87zI4d0MCMRYVQPerG1m49sQI56rTmGw5VfU17D3rg4
	UqjhvcABdNZPsmLxmkUVCT5ptF96j/UvWb9ZO1c4YeXP2XOq0bVSydCp9AzMxMxHS3I7vYHMRXT
	fVtO7OYRh+t6cPmET9HTyqr+qI94ifwWQiuD1wmlP/nK1E9GZ64l2GJTmzp9XOXLv6mdy7TLuDb
	nnngkphhZOJMMabdw821FFJMAbJXc4NNw==
X-Received: by 2002:a17:907:a607:b0:b9d:31c2:37f9 with SMTP id a640c23a62f3a-ba41828cbe5mr1454148566b.2.1776943831719;
        Thu, 23 Apr 2026 04:30:31 -0700 (PDT)
Received: from karaburan ([89.150.155.129])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451210e26sm653242566b.8.2026.04.23.04.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 04:30:31 -0700 (PDT)
From: Jhonata Poma-Hansen <jhonata.poma@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jhonata Poma-Hansen <jhonata.poma@gmail.com>
Subject: [PATCH v3] rsync: add ptest support
Date: Thu, 23 Apr 2026 13:30:19 +0200
Message-ID: <20260423113024.2549245-1-jhonata.poma@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 11:30:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235760

Wire up upstream's runtests.sh testsuite as a ptest package. The
testsuite runs rsync itself through 43 .test scenarios covering
ACLs, xattrs, device nodes, hardlinks, symlinks, daemon mode,
filters, backup, batch, etc., plus 3 CHECK_SYMLINKS variants
(chown-fake, devices-fake, xattrs-hlink).

- Add file://run-ptest. It exports TOOLDIR + rsync_bin + srcdir
  for upstream's runtests.sh and translates its "PASS    name" /
  "SKIP    name" / "FAIL    name" / "XFAIL   name" lines to
  ptest-runner's "PASS: name" / "SKIP: name" / "FAIL: name"
  format via sed. XFAIL (exit 78, upstream's "known-bad, already
  counted as failed") is remapped to SKIP so a known-bad test
  does not flip the whole suite to failed on ptest-runner. sed
  is invoked without -u so the script works under BusyBox sed
  on core-image-minimal (BusyBox does not implement -u / line-
  buffered mode; ptest-runner collects the full output at the
  end so line buffering is not required).

- inherit ptest. RDEPENDS:${PN}-ptest += "bash coreutils
  findutils sed grep diffutils" so the testsuite gets the GNU
  userland it was written against (rsync.fns uses
  find | sort | sed | xargs pipelines to marshal filenames with
  spaces into tls; BusyBox's xargs handles backslash-escaped
  spaces differently from GNU xargs and the tests fail).

- do_compile_ptest: upstream's Makefile only builds the 7
  CHECK_PROGS helper binaries (tls, getgroups, getfsdev,
  testrun, trimslash, t_unsafe, wildtest) and 3 CHECK_SYMLINKS
  through the check / installcheck targets, so build them
  explicitly. Using oe_runmake on the upstream target names
  keeps this list in sync automatically on future rsync
  upgrades (the list lives in Makefile.in, not here).

- wildtest.c in 3.4.1 declares `typedef char bool;`, which
  collides with the native bool keyword added in C23 (gcc 15+
  defaults to -std=gnu23). Pin the helper compile to -std=gnu17
  to match the workaround already used in meta/recipes-core/
  ncurses/ncurses.inc, meta/recipes-devtools/expect/
  expect_5.45.4.bb, meta/recipes-extended/ghostscript/
  ghostscript_10.06.0.bb, and others. Passing CFLAGS on the
  oe_runmake command line is safe here because upstream's
  Makefile does not set per-target CFLAGS for these helpers.

- do_install_ptest: stage runtests.sh, shconfig (required by
  runtests.sh), config.h (runtests.sh greps HAVE_LUTIMES and
  CHOWN_MODIFIES_SYMLINK from it to set TLS_ARGS; otherwise
  those stay empty and lutime / symlink-ownership tests fail
  spuriously), the testsuite/ tree (including the symlinks
  produced by do_compile_ptest), and the 7 helper binaries.
  Also stage the specific upstream source leaves that individual
  tests consume via $srcdir:
    * all *.c (hands_setup uses `cat $srcdir/*.c` as a text
      corpus; intentionally a glob because any top-level .c
      file added in a future rsync release becomes part of the
      corpus automatically)
    * rsync.h       (mkpath.test, itemize.test)
    * configure.ac  (itemize.test)
    * config.sub    (itemize.test)
    * wildtest.txt  (wildmatch.test)
    * support/lsh.sh (the only support/ entry referenced by the
      testsuite; used as an RSYNC_RSH wrapper that emulates
      ssh-to-localhost via sh)
  shconfig inherits SHELL_PATH and FAKEROOT_PATH from the build
  host; retarget SHELL_PATH to /bin/sh (buildpaths QA) and blank
  out FAKEROOT_PATH so tests guarded by [ -e "$FAKEROOT_PATH" ]
  fall through cleanly on target instead of resolving to a
  build-host path.

- PTEST_BUILD_HOST_FILES += "shconfig" so the class's host-path
  scrub runs on it too.

- Add rsync to conf/distro/include/ptest-packagelists.inc under
  PTESTS_SLOW (some tests start a daemon and wait on timeouts).

Runtime verification (qemux86-64, core-image-minimal, crops/
poky:ubuntu-22.04, DEFAULTTUNE=x86-64, testimage + ptest-runner,
slirp + kvm): 39 PASS, 0 FAIL, 7 SKIP (acls, acls-default,
chown-fake, crtimes, devices-fake, ssh-basic, xattrs,
xattrs-hlink; all legitimate for core-image-minimal which
lacks setfacl, root access, ssh host keys, crtime support,
char-device mknod, and xattr write). testimage reports
"core-image-minimal - OK - All required tests passed
(successes=3, skipped=1, failures=0, errors=0)". Package
verification: rsync-ptest contains the 7 helpers, 48 testsuite
entries, runtests.sh + shconfig + config.h + run-ptest + the
48 *.c files + the 5 named source leaves listed above +
support/lsh.sh; package_qa passes.

[YOCTO #16211]

Signed-off-by: Jhonata Poma-Hansen <jhonata.poma@gmail.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-devtools/rsync/files/run-ptest   | 23 +++++++
 meta/recipes-devtools/rsync/rsync_3.4.1.bb    | 64 ++++++++++++++++++-
 3 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/rsync/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 11a894a..31cb1b3 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -139,6 +139,7 @@ PTESTS_SLOW = "\
     python3-cryptography \
     python3-numpy \
     python3-xmltodict \
+    rsync \
     strace \
     tar \
     tcl \
diff --git a/meta/recipes-devtools/rsync/files/run-ptest b/meta/recipes-devtools/rsync/files/run-ptest
new file mode 100644
index 0000000..50f0641
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/run-ptest
@@ -0,0 +1,23 @@
+#!/bin/sh
+cd "$(dirname "$0")"
+
+# rsync's runtests.sh expects (per upstream Makefile.in installcheck target):
+#   rsync_bin   path to rsync to test (we use the installed one)
+#   srcdir      directory containing the testsuite/ subdir
+#   TOOLDIR     directory containing the test helper binaries (tls, ...)
+# runtests.sh also sources ./shconfig (generated by configure at build time).
+#
+# rsync emits "PASS    name", "FAIL    name", "SKIP    name (reason)",
+# "XFAIL   name"; ptest-runner expects "PASS: name" / "FAIL: name" /
+# "SKIP: name". Transform on the fly. XFAIL is rsync's "expected fail"
+# and is counted as failure upstream, but it is a known-bad test and not
+# a regression, so report it as SKIP here so ptest does not fail on it.
+POSIXLY_CORRECT=1 \
+rsync_bin="$(command -v rsync)" \
+srcdir="$(pwd)" \
+TOOLDIR="$(pwd)" \
+./runtests.sh 2>&1 | sed \
+    -e 's/^PASS    \(.*\)/PASS: \1/' \
+    -e 's/^FAIL    \(.*\)/FAIL: \1/' \
+    -e 's/^XFAIL   \(.*\)/SKIP: \1 (xfail)/' \
+    -e 's/^SKIP    \(.*\)/SKIP: \1/'
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
index 697cdee..8b3c563 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
@@ -16,12 +16,13 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
            file://CVE-2025-10158.patch \
+           file://run-ptest \
            "
 SRC_URI[sha256sum] = "2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647cf69850d65fd88c52"
 
 # Out-of-tree builds don't install the documentation currently
 # https://github.com/RsyncProject/rsync/issues/846
-inherit autotools-brokensep
+inherit autotools-brokensep ptest
 
 PACKAGECONFIG ??= "acl attr \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
@@ -63,4 +64,65 @@ do_install:append() {
 	install -m 0644 ${UNPACKDIR}/rsyncd.conf ${D}${sysconfdir}
 }
 
+# runtests.sh invokes these helper binaries from $TOOLDIR; upstream only builds
+# them via the make check/installcheck targets, so build them explicitly here.
+# CHECK_SYMLINKS are test variants that upstream's Makefile also creates only
+# for the check targets, so build them alongside the helpers to keep this list
+# in sync with upstream automatically on future rsync upgrades.
+RSYNC_PTEST_HELPERS = "tls getgroups getfsdev testrun trimslash t_unsafe wildtest"
+RSYNC_PTEST_CHECK_SYMLINKS = "testsuite/chown-fake.test testsuite/devices-fake.test testsuite/xattrs-hlink.test"
+
+# wildtest.c in 3.4.1 declares `typedef char bool;` which collides with the
+# native bool keyword added in C23. Pin to gnu17 for the helper compile so
+# upstream builds cleanly against gcc 15+ defaults. rsync's Makefile does
+# not set per-target CFLAGS for the helper binaries, so overriding CFLAGS
+# on the oe_runmake command line is safe here (nothing to preserve).
+do_compile_ptest() {
+	oe_runmake ${RSYNC_PTEST_HELPERS} CFLAGS="${CFLAGS} -std=gnu17"
+	oe_runmake ${RSYNC_PTEST_CHECK_SYMLINKS}
+}
+
+PTEST_BUILD_HOST_FILES += "shconfig"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/testsuite
+	install -d ${D}${PTEST_PATH}/support
+	install -m 0755 ${S}/runtests.sh ${D}${PTEST_PATH}/
+	install -m 0644 ${B}/shconfig ${D}${PTEST_PATH}/
+	# runtests.sh greps config.h for HAVE_LUTIMES / CHOWN_MODIFIES_SYMLINK to
+	# derive TLS_ARGS. Without config.h those stay empty and some symlink-
+	# and lutime-sensitive tests fail spuriously.
+	install -m 0644 ${B}/config.h ${D}${PTEST_PATH}/
+	cp -a ${S}/testsuite/. ${D}${PTEST_PATH}/testsuite/
+	# Tests consume a handful of named source leaves via $srcdir:
+	#   *.c          - hands_setup uses `cat $srcdir/*.c` as a text corpus
+	#   rsync.h      - mkpath.test, itemize.test
+	#   configure.ac - itemize.test
+	#   config.sub   - itemize.test
+	#   wildtest.txt - wildmatch.test
+	# (Enumerated explicitly rather than globbed so future rsync releases
+	# that add/rename top-level files don't silently change the ptest
+	# package contents.)
+	install -m 0644 ${S}/*.c ${D}${PTEST_PATH}/
+	install -m 0644 ${S}/rsync.h ${D}${PTEST_PATH}/
+	install -m 0644 ${S}/configure.ac ${D}${PTEST_PATH}/
+	install -m 0644 ${S}/config.sub ${D}${PTEST_PATH}/
+	install -m 0644 ${S}/wildtest.txt ${D}${PTEST_PATH}/
+	# Only support/lsh.sh is referenced by the testsuite (as an RSYNC_RSH
+	# wrapper that emulates ssh-to-localhost via sh).
+	install -m 0755 ${S}/support/lsh.sh ${D}${PTEST_PATH}/support/
+	for prog in ${RSYNC_PTEST_HELPERS}; do
+		install -m 0755 ${B}/${prog} ${D}${PTEST_PATH}/
+	done
+	# shconfig hardcodes SHELL_PATH + FAKEROOT_PATH from the build host;
+	# retarget SHELL_PATH to /bin/sh (buildpaths QA) and blank out
+	# FAKEROOT_PATH so tests that guard with `[ -e "$FAKEROOT_PATH" ]`
+	# skip cleanly on target instead of resolving a build-host path.
+	sed -i -e 's|^SHELL_PATH=.*|SHELL_PATH="/bin/sh"|' \
+	       -e 's|^FAKEROOT_PATH=.*|FAKEROOT_PATH=""|' \
+	       ${D}${PTEST_PATH}/shconfig
+}
+
+RDEPENDS:${PN}-ptest += "bash coreutils findutils sed grep diffutils"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.51.2


