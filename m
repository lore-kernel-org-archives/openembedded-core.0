Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C847C54EED
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 14:02:18 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.41405.1675087333078459899
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jan 2023 06:02:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IpmkBSP9;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id hn2-20020a05600ca38200b003dc5cb96d46so1132805wmb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 06:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o+Ojs9xYsO4yhwrlxAJq6Of3rFvmJFJtCfXtFw+Cblw=;
        b=IpmkBSP9jTtvF82VXW9TGXZN9eGg3laQPh7D4GccfSCOUnsCZa/X/uTFCRIy9KMNoU
         rI522eTSzY4TRrhz9wqzF8CHT8DJjSpSfjtsOi0GDLU2Y1676oQT79ywcuTBpCNPkfqX
         wBDyr60z3wk0vkltQGegeHB7HBY58I9+JjqpxYMZ5JWsN6uBWxxu/Tbsl5wcAdDj8m88
         SanVE/UCxDfpnghXBiTxAm7v9SFNLtLqGPp+hAlaI4Qg3Y5dBf4kjm7M1ADbvM2czRJj
         WCR5FZ4pNzCm89TnuV+WI7bBU4Ck2RG07m2WZyN2DVANaFxRDlvFUF/6+HgiQ9wzM4oG
         mlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o+Ojs9xYsO4yhwrlxAJq6Of3rFvmJFJtCfXtFw+Cblw=;
        b=ITJjrWVl/VqBs1UL437Cd0oh8WCWLk8A0Hvjct3sIGTQOiGDD9fKMUOMuGHXvT9keI
         F3z2Kurufr6VxhBhp1BNmZeAbICRErT62q5kbvLdSkZIyWMfb2m7NQ9BX8aDmNQacz50
         ZBGO5sxJLyOSf5cLMQdfbTsGDxuHI5Ituhlq8xatXkyAED6SMllIO9C4Z+15AYg2Gv1v
         cjFQ6K1FIeDSZR9AUwkuiwWc90mkt2Ubwg06SBdoE9Wy77BFF2X2CTlCZlC+XGVJ7EIZ
         6prDdrzLDRq4e+M3obHOgUfKcW3bR6g7Nu5pSjgNaUxXH3UbC48+0rbxivkMqqYQRcjz
         +7GA==
X-Gm-Message-State: AO0yUKW9PdftlqMhPkws2U9C/WGzkXhx5eivREPK1jL/hsWtgpBt7Vp8
	e7wBJ+rlIjsM7BFuGilv6HARMgEw4VE=
X-Google-Smtp-Source: AK7set8THh2H1Mama4nb5YDkHymvudvx2mseY2/am1FZwP9If9nL76C31n/XUZCXoYaT2Tl66GkXiw==
X-Received: by 2002:a05:600c:4e10:b0:3dc:5a13:c7d1 with SMTP id b16-20020a05600c4e1000b003dc5a13c7d1mr3611453wmq.16.1675087331100;
        Mon, 30 Jan 2023 06:02:11 -0800 (PST)
Received: from localhost.localdomain ([109.170.137.206])
        by smtp.gmail.com with ESMTPSA id c11-20020adfa30b000000b002bfb5ebf8cfsm12028897wrb.21.2023.01.30.06.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 06:02:10 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH] rust: Add `update_snapshot` task to generate `rust-snapshot.inc`
Date: Mon, 30 Jan 2023 14:01:40 +0000
Message-Id: <20230130140140.9883-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 14:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176494

Everything we need for `rust-snapshot.inc` exists in `src/stage0.json`,
so just read that to generate it.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-devtools/rust/rust_1.67.0.bb | 60 +++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust_1.67.0.bb b/meta/recipes-devtools/rust/rust_1.67.0.bb
index f4ac8bc6350b..148e60153996 100644
--- a/meta/recipes-devtools/rust/rust_1.67.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.67.0.bb
@@ -289,6 +289,66 @@ rust_do_install:class-target() {
     rm ${D}${libdir}/rustlib/manifest*
 }
 
+addtask do_update_snapshot after do_patch
+do_update_snapshot[nostamp] = "1"
+
+# Run with `bitbake -c update_snapshot rust` to update `rust-snapshot.inc`
+# with the checksums for the rust snapshot associated with this rustc-src
+# tarball.
+python do_update_snapshot() {
+    import json
+    import re
+    import sys
+
+    from collections import defaultdict
+
+    with open(os.path.join(d.getVar("S"), "src", "stage0.json")) as f:
+        j = json.load(f)
+
+    config_dist_server = j['config']['dist_server']
+    compiler_date = j['compiler']['date']
+    compiler_version = j['compiler']['version']
+
+    src_uri = defaultdict(list)
+    for k, v in j['checksums_sha256'].items():
+        m = re.search(f"dist/{compiler_date}/(?P<component>.*)-{compiler_version}-(?P<arch>.*)-unknown-linux-gnu\\.tar\\.xz", k)
+        if m:
+            component = m.group('component')
+            arch = m.group('arch')
+            src_uri[arch].append(f"SRC_URI[{component}-snapshot-{arch}.sha256sum] = \"{v}\"")
+
+    snapshot = """\
+## This is information on the rust-snapshot (binary) used to build our current release.
+## snapshot info is taken from rust/src/stage0.json
+## Rust is self-hosting and bootstraps itself with a pre-built previous version of itself.
+## The exact (previous) version that has been used is specified in the source tarball.
+## The version is replicated here.
+
+SNAPSHOT_VERSION = "%s"
+
+""" % compiler_version
+
+    for arch, components in src_uri.items():
+        snapshot += "\n".join(components) + "\n\n"
+
+    snapshot += """\
+SRC_URI += " \\
+    ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \\
+    ${RUST_DIST_SERVER}/dist/${RUSTC_SNAPSHOT}.tar.xz;name=rustc-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \\
+    ${RUST_DIST_SERVER}/dist/${CARGO_SNAPSHOT}.tar.xz;name=cargo-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \\
+"
+
+RUST_DIST_SERVER = "%s"
+
+RUST_STD_SNAPSHOT = "rust-std-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
+RUSTC_SNAPSHOT = "rustc-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
+CARGO_SNAPSHOT = "cargo-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
+""" % config_dist_server
+
+    with open(os.path.join(d.getVar("THISDIR"), "rust-snapshot.inc"), "w") as f:
+        f.write(snapshot)
+}
+
 RUSTLIB_DEP:class-nativesdk = ""
 
 # musl builds include libunwind.a
-- 
2.39.0


