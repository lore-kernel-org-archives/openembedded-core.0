Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.7772.1630502607579289982
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:23:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M8PUYjcY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id d22-20020a1c1d16000000b002e7777970f0so4766951wmd.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=p29GQhBC/Dg/buNs0c7x14wLbShFL7IIPTzLcFVlZXo=;
        b=M8PUYjcYkqTrEIkBn59eivm+Enx6n7IFc25i5bfpsQSdrxkHhMW6dENPeZxKZsM61H
         iaQqJSmSBn/itiwsQoKzQgvtDHOEdq44c11gTjrK4D2i5iMAwv/Rzx38cKLgNZxDQuuZ
         B7iS1UwCWCClQfRFkUjyOHX1skJjt0DzyGhr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p29GQhBC/Dg/buNs0c7x14wLbShFL7IIPTzLcFVlZXo=;
        b=KuizI7umkDx80MtEleoHG3IRUvBFtV/3cUxa4gPdNXBFpVIYkCJb3D43XTKSbwcl6n
         YIc4kKuApKm23qYemjFZUS4xft9VmvErcat8gqcIwnwS9GTessCBphGszNrpKgqPZF2G
         Beh8C/3v4R9Vx2wKtEAtCsP+5B7lp/VCBbGPWv80X5/Y7GZP0JRS/G6UpiN3Lmx95RQV
         5ASBTQhSDMLYxARu5gDW4OjM0LgvdfQOOwmaHVFCUp860A4JJqOgFwfYWq1Cs6K3+Pyx
         l/jHTQ2SzuUyKja63UMPoImp09Z77jVsR7uv3UHZDAgUNLHgWNm8zPW8SWk1f7pw/zDc
         CYTw==
X-Gm-Message-State: AOAM530kzVnfPz4bCvzaNv/KC/rpFY55iy0a1MXBpnvzOo0Da1nlzCke
	yjcJNW1qmDbadiM/k9K2YrQvAerwfOC4XA==
X-Google-Smtp-Source: ABdhPJxNYOxl7rKmwDLb9+xTljOf+3l+fTkh1KcaxremoZaay5n4tHgO0y/p9W2nncwtHAxELGf90g==
X-Received: by 2002:a1c:3587:: with SMTP id c129mr3255029wma.57.1630502595785;
        Wed, 01 Sep 2021 06:23:15 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7e06:66c6:32e7:e304])
        by smtp.gmail.com with ESMTPSA id z137sm6098786wmc.14.2021.09.01.06.23.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:23:15 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] cargo: Hack around LD_LIBRARY_PATH issues on centos7
Date: Wed,  1 Sep 2021 14:23:13 +0100
Message-Id: <20210901132313.901890-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901132313.901890-1-richard.purdie@linuxfoundation.org>
References: <20210901132313.901890-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building cargo-native on centos7 with buildtools tarball installed,
we see failures:

/bin/sh: /lib64/libc.so.6: version `GLIBC_2.33' not found (required by /home/pokybuild/yocto-worker/reproducible-centos/build/build-st/tmp/work/x86_64-linux/cargo-native/1.54.0-r0/recipe-sysroot-native/usr/lib/libtinfo.so.5)

The reason for this is that the wrapper script
cargo-native/1.54.0-r0/wrapper/target-rust-ccld has /bin/sh as it's
interpreter and cargo calls this with LD_LIBRARY_PATH set to include the
recipe-sysroot-native. The host /bin/sh links to libtinfo from the host
but it finds the version in the sysroot which needs a newer libc. This
results in the above error since the loader is an older libc and the two
are incompatible.

Our ccld wrapper calls gcc/ld which don't need the LD_LIBRARY_PATH
variable set. We can't patch this out the source since we're using
a prebuilt binary to generate a new cargo binary so this is impossible
to bootstrap.

Instead, put a binary wrapper into place which removes LD_LIBRARY_PATH
from the environment before calling the original wrapper (left in shell
as it is simpler to maintain).

Also add the interpreter relocation trick from uninative to the prebuilt
cargo binary to match rust-native, just in case that causes other problems
later too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/cargo/cargo.inc         | 12 ++++++++
 .../cargo/files/ccld-wrapper.c                | 29 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/cargo/files/ccld-wrapper.c

diff --git a/meta/recipes-devtools/cargo/cargo.inc b/meta/recipes-devtools/cargo/cargo.inc
index 6161c327e81..a114266eac4 100644
--- a/meta/recipes-devtools/cargo/cargo.inc
+++ b/meta/recipes-devtools/cargo/cargo.inc
@@ -20,6 +20,11 @@ inherit cargo
 
 do_cargo_setup_snapshot () {
 	${WORKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.sh --prefix="${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig
+	# Need to use uninative's loader if enabled/present since the library paths
+	# are used internally by rust and result in symbol mismatches if we don't
+	if [ ! -z "${UNINATIVE_LOADER}" -a -e "${UNINATIVE_LOADER}" ]; then
+		patchelf-uninative ${WORKDIR}/${CARGO_SNAPSHOT}/bin/cargo --set-interpreter ${UNINATIVE_LOADER}
+	fi
 }
 
 addtask cargo_setup_snapshot after do_unpack before do_configure
@@ -47,3 +52,10 @@ export LIBSSH2_SYS_USE_PKG_CONFIG = "1"
 # so we must use the locally set up snapshot to bootstrap the build.
 BASEDEPENDS:remove:class-native = "cargo-native"
 CARGO:class-native = "${WORKDIR}/${CARGO_SNAPSHOT}/bin/cargo"
+
+SRC_URI += "file://ccld-wrapper.c"
+
+do_rust_create_wrappers:append () {
+	mv ${RUST_TARGET_CCLD} ${RUST_TARGET_CCLD}.real
+	${BUILD_CC} ${WORKDIR}/ccld-wrapper.c -o ${RUST_TARGET_CCLD}
+}
diff --git a/meta/recipes-devtools/cargo/files/ccld-wrapper.c b/meta/recipes-devtools/cargo/files/ccld-wrapper.c
new file mode 100644
index 00000000000..6bc9958b907
--- /dev/null
+++ b/meta/recipes-devtools/cargo/files/ccld-wrapper.c
@@ -0,0 +1,29 @@
+/*
+ * Copyright 2021 Richard Purdie
+ *
+ * SPDX-License-Identifier: GPL-2.0-only
+ */
+
+#include <errno.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+/*
+ * Run the original script (argv[0] + ".real") with LD_LIBRARY_PATH unset
+ * This avoids issues where cargo is running a wrapper script using /bin/sh from the host
+ * which links to something which has an incompatible version in in recipe-sysroot-native
+ * such as libtinfo on centos 7.
+ */
+
+int main(int argc, char* argv[]) {
+    char *real = malloc(strlen(argv[0] + 5));
+    strcpy(real, argv[0]);
+    strcpy(real + strlen(argv[0]), ".real");
+    putenv("LD_LIBRARY_PATH=");
+    if(execv(real, argv) == -1) {
+        printf("Wrapper failed to execute, error: %s\n", strerror(errno));
+        return -1;
+    }
+}
-- 
2.32.0

