Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.1683.1614644298548277714
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 16:18:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NQbyOrh7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id j2so5156911wrx.9
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Mar 2021 16:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=a4+69NPVUD3hVaIH53CwHIfBQUVkve4Drr0siyD62EE=;
        b=NQbyOrh7HdkzmoKK+k/fdjWbR1mzCgmgUuGAFFOit/IsAUhEZIJGtF254Wl9/m8eLG
         ++HqQv20B1pp/OQVWkyRDYa4Oj0K16R5YeBCtSM0dro/heBeLX5QqdKZ1IOyvKuyc8gC
         4VWJWEkyrEBiE0GBAFFCLYAxLk3RqnRW19pMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a4+69NPVUD3hVaIH53CwHIfBQUVkve4Drr0siyD62EE=;
        b=PEN9SqCCkB1SY5ErLXD1gnjraDfAEK9fUI7xztADjXuXfBKjKXmfeIsNkiWaaB7kU+
         eomwHJo93/cBIbnzxyK3/8MlID0J9SSBJVkPmy5ul3TtwFJqiZtgvNmMQiF2itlEtEHB
         3VBkcGEQT+jJMkPhQPSwOHTGjeJkb5TOsX4Wb8cS2nr9XgbP1P5Ap0i2FhnLxbxqburb
         eHHz5HtNo5qMP4vlDJh1nru2b41bUa9+bQb1EUhxsucH3aImx+dN2O/EfWrZMuC/ZzpG
         7UBouJtR6ju9y9YhD3KJtcDDYW+C5H8o0IrxEywhdG5NgaQ+qxKIC6k82LsYBUqQtxsg
         csPQ==
X-Gm-Message-State: AOAM532Eszxn7JWqabryst+95LnWPQCFDmBJJaCgza82qukfF41r2sdm
	wgVuyyd9+P881shUtT6zJxXpoCWVDIakNw==
X-Google-Smtp-Source: ABdhPJwBXYtPTUlhUqK2Sct8Gte2hhCCvGLgIZgG0nXgBOzQBKs77Q6jm6CiUTFh5myy18XwO8/hGw==
X-Received: by 2002:adf:ed87:: with SMTP id c7mr4560431wro.9.1614644296855;
        Mon, 01 Mar 2021 16:18:16 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:fd4c:95a0:62b1:7d53])
        by smtp.gmail.com with ESMTPSA id j16sm1569045wmi.2.2021.03.01.16.18.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 16:18:16 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] lttng: Fix reproducibility issues
Date: Tue,  2 Mar 2021 00:18:15 +0000
Message-Id: <20210302001815.2209318-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210302001815.2209318-1-richard.purdie@linuxfoundation.org>
References: <20210302001815.2209318-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a hack to hardcode in specific rpaths which we then remove,
allowing the build to be reproducible.

Strip build patches out of one of the test scripts too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py  |  2 -
 .../lttng/lttng-tools/determinism.patch       | 64 +++++++++++++++++++
 .../lttng/lttng-tools_2.12.2.bb               |  7 ++
 3 files changed, 71 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/determinism.patch

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index b78f5e1d7f0..1d4e744250a 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -34,8 +34,6 @@ exclude_packages = [
 	'go-runtime',
 	'go_',
 	'go-',
-	'lttng-tools-dbg',
-	'lttng-tools-ptest',
 	'ltp',
 	'meson',
 	'ovmf-shell-efi',
diff --git a/meta/recipes-kernel/lttng/lttng-tools/determinism.patch b/meta/recipes-kernel/lttng/lttng-tools/determinism.patch
new file mode 100644
index 00000000000..b2ab880bd67
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/determinism.patch
@@ -0,0 +1,64 @@
+This is a bit ugly. Specifing abs_builddir as an RPATH is plain wrong when
+cross compiling. Sadly, removing the rpath makes libtool/automake do
+weird things and breaks the build as shared libs are no longer generated.
+
+We already try and delete the RPATH at do_install with chrpath however
+that does leave the path in the string table so it doesn't help us
+with reproducibility.
+
+Instead, hack in a bogus but harmless path, then delete it later in
+our do_install. Ultimately we may want to pass a specific path to use
+to configure if we really do need to set an RPATH at all. It is unclear
+to me whether the tests need that or not.
+
+Fixes reproducibility issues for lttng-tools.
+
+Upstream-Status: Pending [needs discussion with upstream about the correct solution]
+RP 2021/3/1
+
+Index: lttng-tools-2.12.2/tests/regression/ust/ust-dl/Makefile.am
+===================================================================
+--- lttng-tools-2.12.2.orig/tests/regression/ust/ust-dl/Makefile.am
++++ lttng-tools-2.12.2/tests/regression/ust/ust-dl/Makefile.am
+@@ -27,16 +27,16 @@ noinst_LTLIBRARIES = libzzz.la libbar.la
+ 
+ libzzz_la_SOURCES = libzzz.c libzzz.h
+ libzzz_la_LDFLAGS = -module -shared -avoid-version \
+-		-rpath $(abs_builddir)
++		-rpath /usr/lib
+ 
+ libbar_la_SOURCES = libbar.c libbar.h
+ libbar_la_LDFLAGS = -module -shared -avoid-version \
+-		-rpath $(abs_builddir)
++		-rpath /usr/lib
+ libbar_la_LIBADD = libzzz.la
+ 
+ libfoo_la_SOURCES = libfoo.c libfoo.h
+ libfoo_la_LDFLAGS = -module -shared -avoid-version \
+-		-rpath $(abs_builddir)
++		-rpath /usr/lib
+ libfoo_la_LIBADD = libbar.la
+ 
+ CLEANFILES = libfoo.so libfoo.so.debug libbar.so libbar.so.debug \
+@@ -44,7 +44,7 @@ CLEANFILES = libfoo.so libfoo.so.debug l
+ 
+ libtp_la_SOURCES = libbar-tp.h libbar-tp.c libfoo-tp.h libfoo-tp.c \
+ 	libzzz-tp.h libzzz-tp.c
+-libtp_la_LDFLAGS = -module -shared -rpath $(abs_builddir)
++libtp_la_LDFLAGS = -module -shared -rpath /usr/lib
+ 
+ # Extract debug symbols
+ libfoo.so.debug: libfoo.la
+Index: lttng-tools-2.12.2/tests/utils/testapp/userspace-probe-elf-binary/Makefile.am
+===================================================================
+--- lttng-tools-2.12.2.orig/tests/utils/testapp/userspace-probe-elf-binary/Makefile.am
++++ lttng-tools-2.12.2/tests/utils/testapp/userspace-probe-elf-binary/Makefile.am
+@@ -5,7 +5,7 @@ AM_CFLAGS += -O0
+ noinst_LTLIBRARIES = libfoo.la
+ 
+ libfoo_la_SOURCES = foo.c foo.h
+-libfoo_la_LDFLAGS = -shared -module -avoid-version -rpath $(abs_builddir)/.libs/
++libfoo_la_LDFLAGS = -shared -module -avoid-version -rpath /usr/lib
+ 
+ noinst_PROGRAMS = userspace-probe-elf-binary
+ userspace_probe_elf_binary_SOURCES = userspace-probe-elf-binary.c
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb b/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
index 9618a86650f..52bfd36370f 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
@@ -36,6 +36,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://run-ptest \
            file://lttng-sessiond.service \
            file://0001-tests-regression-disable-the-tools-live-tests.patch \
+           file://determinism.patch \
            "
 
 SRC_URI[sha256sum] = "9ed9161795ff023b076f9f95afaa4f1f822ec42495c0fa04c586ab8fa74e84f1"
@@ -114,6 +115,8 @@ do_install_ptest () {
     done
 
     chrpath --delete ${D}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary/userspace-probe-elf-binary
+    chrpath --delete ${D}${PTEST_PATH}/tests/regression/ust/ust-dl/libbar.so
+    chrpath --delete ${D}${PTEST_PATH}/tests/regression/ust/ust-dl/libfoo.so
 
     #
     # Use the versioned libs of liblttng-ust-dl.
@@ -151,6 +154,10 @@ do_install_ptest () {
         -e 's#\(^test.*LDADD.=\)#disable\1#g' \
         -i ${D}${PTEST_PATH}/tests/unit/Makefile
 
+    # Fix hardcoded build path
+    sed -e 's#TESTAPP_PATH=.*/tests/regression/#TESTAPP_PATH=${PTEST_PATH}/tests/regression/#' \
+        -i ${D}${PTEST_PATH}/tests/regression/ust/python-logging/test_python_logging
+
     # Substitute links to installed binaries.
     for prog in lttng lttng-relayd lttng-sessiond lttng-consumerd lttng-crash; do
         exedir="${D}${PTEST_PATH}/src/bin/${prog}"
-- 
2.27.0

