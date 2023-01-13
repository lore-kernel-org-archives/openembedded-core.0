Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D073EC54EBE
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 17:15:46 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.93892.1673630139178825368
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 09:15:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SR3p76d/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BE22360004;
	Fri, 13 Jan 2023 17:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673630137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cNlguJzzDsNaObqoWIxJM2uIDsjmtFTK3mKun4rN+10=;
	b=SR3p76d/Un8PKFrPORuzoznAGldVugMqb/dYsz3DKTaFWawdJIEkiy4OCJH2wQ8wy5a3SR
	nthuoke0vOCbAExIi8zebZzi7Uzld90QoesaDngcm//eQq5Az0igTShSZRAwC2TfxMgoUb
	FHkazBwylUinOH5sy/sCRHIhJhJ2Dx33/6YNAOo2bTjt5QHg3eNK5Q4UMQGoLBXNjRmvAj
	cys4FT1Cnpb2Bh3/lCQpYpgtXe0ewOBH/BieqiPcdi1e26K+wEzo8siaylA6LuUNIxENlI
	BzOBE2juHAuGimU4GStfZniutPsWjgmUn/Qdcl65SBDYIP0BjlOldcHFqRK39w==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] rust-bin.bbclass: remove unused class
Date: Fri, 13 Jan 2023 18:15:25 +0100
Message-Id: <20230113171525.1503649-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 17:15:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175845

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta/classes-recipe/rust-bin.bbclass | 154 ---------------------------
 1 file changed, 154 deletions(-)
 delete mode 100644 meta/classes-recipe/rust-bin.bbclass

diff --git a/meta/classes-recipe/rust-bin.bbclass b/meta/classes-recipe/rust-bin.bbclass
deleted file mode 100644
index b8e7ef8191..0000000000
--- a/meta/classes-recipe/rust-bin.bbclass
+++ /dev/null
@@ -1,154 +0,0 @@
-#
-# Copyright OpenEmbedded Contributors
-#
-# SPDX-License-Identifier: MIT
-#
-
-inherit rust
-
-RDEPENDS:${PN}:append:class-target = " ${RUSTLIB_DEP}"
-
-RUSTC_ARCHFLAGS += "-C opt-level=3 -g -L ${STAGING_DIR_HOST}/${rustlibdir} -C linker=${RUST_TARGET_CCLD}"
-EXTRA_OEMAKE += 'RUSTC_ARCHFLAGS="${RUSTC_ARCHFLAGS}"'
-
-# Some libraries alias with the standard library but libstd is configured to
-# make it difficult or imposisble to use its version. Unfortunately libstd
-# must be explicitly overridden using extern.
-OVERLAP_LIBS = "\
-    libc \
-    log \
-    getopts \
-    rand \
-"
-def get_overlap_deps(d):
-    deps = d.getVar("DEPENDS").split()
-    overlap_deps = []
-    for o in d.getVar("OVERLAP_LIBS").split():
-        l = len([o for dep in deps if (o + '-rs' in dep)])
-        if l > 0:
-            overlap_deps.append(o)
-    return " ".join(overlap_deps)
-OVERLAP_DEPS = "${@get_overlap_deps(d)}"
-
-# Prevents multiple static copies of standard library modules
-# See https://github.com/rust-lang/rust/issues/19680
-RUSTC_PREFER_DYNAMIC = "-C prefer-dynamic"
-RUSTC_FLAGS += "${RUSTC_PREFER_DYNAMIC}"
-
-CRATE_NAME ?= "${@d.getVar('BPN').replace('-rs', '').replace('-', '_')}"
-BINNAME ?= "${BPN}"
-LIBNAME ?= "lib${CRATE_NAME}-rs"
-CRATE_TYPE ?= "dylib"
-BIN_SRC ?= "${S}/src/main.rs"
-LIB_SRC ?= "${S}/src/lib.rs"
-
-rustbindest ?= "${bindir}"
-rustlibdest ?= "${rustlibdir}"
-RUST_RPATH_ABS ?= "${rustlibdir}:${rustlib}"
-
-def relative_rpaths(paths, base):
-    relpaths = set()
-    for p in paths.split(':'):
-        if p == base:
-            relpaths.add('$ORIGIN')
-            continue
-        relpaths.add(os.path.join('$ORIGIN', os.path.relpath(p, base)))
-    return '-rpath=' + ':'.join(relpaths) if len(relpaths) else ''
-
-RUST_LIB_RPATH_FLAGS ?= "${@relative_rpaths(d.getVar('RUST_RPATH_ABS', True), d.getVar('rustlibdest', True))}"
-RUST_BIN_RPATH_FLAGS ?= "${@relative_rpaths(d.getVar('RUST_RPATH_ABS', True), d.getVar('rustbindest', True))}"
-
-def libfilename(d):
-    if d.getVar('CRATE_TYPE', True) == 'dylib':
-        return d.getVar('LIBNAME', True) + '.so'
-    else:
-        return d.getVar('LIBNAME', True) + '.rlib'
-
-def link_args(d, bin):
-    linkargs = []
-    if bin:
-        rpaths = d.getVar('RUST_BIN_RPATH_FLAGS', False)
-    else:
-        rpaths = d.getVar('RUST_LIB_RPATH_FLAGS', False)
-        if d.getVar('CRATE_TYPE', True) == 'dylib':
-            linkargs.append('-soname')
-            linkargs.append(libfilename(d))
-    if len(rpaths):
-        linkargs.append(rpaths)
-    if len(linkargs):
-        return ' '.join(['-Wl,' + arg for arg in linkargs])
-    else:
-        return ''
-
-get_overlap_externs () {
-    externs=
-    for dep in ${OVERLAP_DEPS}; do
-        extern=$(ls ${STAGING_DIR_HOST}/${rustlibdir}/lib$dep-rs.{so,rlib} 2>/dev/null \
-                    | awk '{print $1}');
-        if [ -n "$extern" ]; then
-            externs="$externs --extern $dep=$extern"
-        else
-            echo "$dep in depends but no such library found in ${rustlibdir}!" >&2
-            exit 1
-        fi
-    done
-    echo "$externs"
-}
-
-do_configure () {
-}
-
-oe_runrustc () {
-	bbnote ${RUSTC} ${RUSTC_ARCHFLAGS} ${RUSTC_FLAGS} "$@"
-	"${RUSTC}" ${RUSTC_ARCHFLAGS} ${RUSTC_FLAGS} "$@"
-}
-
-oe_compile_rust_lib () {
-    rm -rf ${LIBNAME}.{rlib,so}
-    local -a link_args
-    if [ -n '${@link_args(d, False)}' ]; then
-        link_args[0]='-C'
-        link_args[1]='link-args=${@link_args(d, False)}'
-    fi
-    oe_runrustc $(get_overlap_externs) \
-        "${link_args[@]}" \
-        ${LIB_SRC} \
-        -o ${@libfilename(d)} \
-        --crate-name=${CRATE_NAME} --crate-type=${CRATE_TYPE} \
-        "$@"
-}
-oe_compile_rust_lib[vardeps] += "get_overlap_externs"
-
-oe_compile_rust_bin () {
-    rm -rf ${BINNAME}
-    local -a link_args
-    if [ -n '${@link_args(d, True)}' ]; then
-        link_args[0]='-C'
-        link_args[1]='link-args=${@link_args(d, True)}'
-    fi
-    oe_runrustc $(get_overlap_externs) \
-        "${link_args[@]}" \
-        ${BIN_SRC} -o ${BINNAME} "$@"
-}
-oe_compile_rust_bin[vardeps] += "get_overlap_externs"
-
-oe_install_rust_lib () {
-    for lib in $(ls ${LIBNAME}.{so,rlib} 2>/dev/null); do
-        echo Installing $lib
-        install -D -m 755 $lib ${D}/${rustlibdest}/$lib
-    done
-}
-
-oe_install_rust_bin () {
-    echo Installing ${BINNAME}
-    install -D -m 755 ${BINNAME} ${D}/${rustbindest}/${BINNAME}
-}
-
-do_rust_bin_fixups() {
-    for f in `find ${PKGD} -name '*.so*'`; do
-        echo "Strip rust note: $f"
-        ${OBJCOPY} -R .note.rustc $f $f
-    done
-}
-PACKAGE_PREPROCESS_FUNCS += "do_rust_bin_fixups"
-
-- 
2.37.2


