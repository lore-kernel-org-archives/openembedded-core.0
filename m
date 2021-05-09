Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web12.20565.1620575822393034008
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 May 2021 08:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VFn0C4Sz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id s82so7796404wmf.3
        for <openembedded-core@lists.openembedded.org>; Sun, 09 May 2021 08:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/BQL6tevuM2Z6YW+lEDD2vKz4O1Iw2hDQAKLKfqmyd0=;
        b=VFn0C4Sz6vjhfI2vseXD4osdxcDA4U203jjjTxrRsk5fntCcbpQ6yrE/gWJ2JWk/6T
         Y1MuzVEv6IHYCKG0WFFLmrweMdxD7o9fNCPNcqdCRV0nn/yhX8+QHso7UW7gwzPTBIJz
         6H9XEcFIdq0qQngs247l8FarAXMAtL5Rr9y5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/BQL6tevuM2Z6YW+lEDD2vKz4O1Iw2hDQAKLKfqmyd0=;
        b=fWlcrU5OoEgiZAgYp0kKh/armoOFOj2rhycwDSmu7BoHPJLQfQo18v0/D+TN0lLj4N
         78caGvko0yfX65O4LrFJbueNJxwVjQcGknpyf4Dbnp/ac8CZhZnAXTfEqfNuhhH3HyI5
         F2iPsn3nGLdgEezW91qwc1Kwzo6GT1aMwUG/o1g0parYShm16a9gEZKhMpS5wpopH4AP
         ZIlmSC36PnLyL/yhH0IfLjfwnWbsrmdOk9rDuYho3ZGGqr0iC4izKv9u9gAyx1u+c4rw
         zEnEz5d7kphYxleigLhQBF2CfHkfNVAiPvTWvj/4UnCsclMSEL2iMVK3kDNV7DUL9qpW
         zx8Q==
X-Gm-Message-State: AOAM530AjH085AEK6rey0OPHqNW43PFD6sPXqcHGAmqCx/zh7nNOYsW7
	1xBrcQaB/soye6FgGboHamic9SKLVE/uWA==
X-Google-Smtp-Source: ABdhPJzWJZXwNnhGdaB9t4WK5a40WdjpUJaxM9JKz8Y5WZiGwrN23js8lVOBRHTNUULWO0wAi4MzXA==
X-Received: by 2002:a1c:35c6:: with SMTP id c189mr32435561wma.127.1620575820714;
        Sun, 09 May 2021 08:57:00 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:2a5:760d:7a5d:1e99])
        by smtp.gmail.com with ESMTPSA id x65sm25932141wmg.36.2021.05.09.08.57.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 08:57:00 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ovmf: Improve reproducibility by enabling prefix mapping
Date: Sun,  9 May 2021 16:56:59 +0100
Message-Id: <20210509155659.2131070-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We want to pass ${DEBUG_PREFIX_MAP} to gcc commands and also pass in
--debug-prefix-map to nasm (we carry a patch to nasm for this). The
tools commands are built by ovmf-native so we need to patch this in
at target build time when we know the right values. This function also
has to be able to undo what it changed and rerun. By using determininistc
file paths in the ovmf build, it removes the opportunitity for gcc/ld to
change the output binaries due to path lengths overflowing section sizes
and causing small changes in the binary output.

This also means that if builds have reproducibility issues in future, it
becomes much easier to compare intermediate build artefacts.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 896b3b63202..91de742c06c 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -104,6 +104,33 @@ fix_toolchain_append_class-native() {
         ${S}/BaseTools/Conf/tools_def.template
 }
 
+#
+# We want to pass ${DEBUG_PREFIX_MAP} to gcc commands and also pass in
+# --debug-prefix-map to nasm (we carry a patch to nasm for this). The
+# tools commands are built by ovmf-native so we need to patch this in
+# at target build time when we know the right values. This function also
+# has to be able to undo what it changed and rerun. By using determininistc
+# file paths during the ovmf build, it removes the opportunitity for gcc/ld to
+# change the output binaries due to path lengths overflowing section sizes
+# and causing small changes in the binary output. Previously we relied on 
+# the stripped output being the same which isn't always the case if the 
+# size of the debug symbols varies.
+#
+do_configure_class-target() {
+    sed -i \
+        -e 's# DEF(GCC_PREFIX_MAP)##g' \
+        -e 's# DEF(NASM_PREFIX_MAP)##g' \
+        -e '/^DEFINE \(GCC|NASM\)_PREFIX_MAP/d' \
+        -e 's#^\(DEFINE GCC_ALL_CC_FLAGS.*=.*\)\r$#\1 DEF(GCC_PREFIX_MAP)#' \
+        -e 's#^\(DEFINE GCC_PP_FLAGS.*=.*\)\r$#\1 DEF(GCC_PREFIX_MAP)#' \
+        -e 's#^\(DEFINE GCC_ASM_FLAGS.*=.*\)\r$#\1 DEF(GCC_PREFIX_MAP)#' \
+        -e 's#^\(*_GCC5_IA32_NASM_FLAGS.*=.*\)\r$#\1 DEF(NASM_PREFIX_MAP)#' \
+        -e 's#^\(*_GCC5_X64_NASM_FLAGS.*=.*\)\r$#\1 DEF(NASM_PREFIX_MAP)#' \
+        -e '1 i\DEFINE NASM_PREFIX_MAP = --debug-prefix-map=${WORKDIR}=/usr/src/debug/ovmf/${EXTENDPE}${PV}-${PR}' \
+        -e '1 i\DEFINE GCC_PREFIX_MAP = ${DEBUG_PREFIX_MAP}' \
+        ${STAGING_BINDIR_NATIVE}/${EDK_TOOLS_DIR}/BaseTools/Conf/tools_def.template
+}
+
 GCC_VER="$(${CC} -v 2>&1 | tail -n1 | awk '{print $3}')"
 
 fixup_target_tools() {
-- 
2.30.2

