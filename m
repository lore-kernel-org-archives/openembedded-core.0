Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web08.14957.1620413287900621496
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 11:48:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l9mpibhg;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a4so15092100ejk.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 May 2021 11:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a/eOgE1YMLCXftWLDU3Jw4SFFVYS5NyUrAAxSU4RZzM=;
        b=l9mpibhgpsq7OKTORyTVFqU7vaTHZDluWsWnlRoTUcQSq1pF2axT5WCQaAry2CBVn+
         RTh61VesWiYXjTgbnFqupyq/hU5Tv1t3a8+HsqcYRtc/HkEeSH+oNLQ/tFxC1rKX/aQk
         /B91BYgX0s7NwqLPkumEuBbtowq53oy/V4I5D2caj3hOWmcen3VR/w1jtVyO3yvSB8c2
         y8j25o+loipMo9PNg5ciXVNhrk6d0aWiF+6yscsZgT8wyq5BNti85BF00OogzTlJ+ohr
         rWKfo34EpKSCiLlMFuo5SxydiIPDuQTHQ+Uk74ZHS2LFiwX2WA4QRO3K6N0ZN9aNLUi0
         4zRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a/eOgE1YMLCXftWLDU3Jw4SFFVYS5NyUrAAxSU4RZzM=;
        b=UGSZw1UJ6JiJbPOBAr8Z1DEaPaMRzzgd75qmiPSif2z9yQwHKMpyRqHgpP30OZZ4de
         qle2ITSBz091uZgX+2drtqWolA3IzdAPf3Fv6FX90KGWZ0OjQ1fqtaJDL8urNJKGi2XK
         074j09vZgWGBlyOiyy7T7S9Al1twB613igZMBcn+6RnXa5FTY0j6q0X0WotsWcY94/VG
         a4iTN2K4px8p56VL2u469EC3KBr33FiO7itkgHd7dA+6zDqWid69GNq6qHzdv9C3jCM9
         IWGM9TAUxlXBnzY4w77v0t8oA+km1aHvOLuiX4ffaJdNNjsZ9CSKqnPvleMlG9mcDxk+
         cu5A==
X-Gm-Message-State: AOAM5339PspZ80sS9lhwsbeH1k3P5fsjyi1a8TMSfmUVMJ6fooQUqdXp
	3FDv+inU/2NIS1Kg4md5nFAlEEG8Jso=
X-Google-Smtp-Source: ABdhPJwxhrffi0dGdSlrqnJYswlXdI8tlRrzqIIwdkdSrNDVBQ/upKQvzxTmyxD+A3/9khC6VOoohA==
X-Received: by 2002:a17:906:a0a:: with SMTP id w10mr11423328ejf.416.1620413286291;
        Fri, 07 May 2021 11:48:06 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id u8sm4556790edo.71.2021.05.07.11.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 11:48:05 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] ptest: add a test for orphaned ptests, and restore ones found by it
Date: Fri,  7 May 2021 20:48:01 +0200
Message-Id: <20210507184801.733222-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Particularly, numactl, numpy and libseccomp are disabled for now
due to failures or lack of qemu support. The rest have been verified
to pass quickly.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/ptest.bbclass                    | 11 ++++
 .../distro/include/ptest-packagelists.inc     | 50 +++++++++++++++----
 2 files changed, 50 insertions(+), 11 deletions(-)

diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index 47611edea2..a270bf4cc5 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -20,6 +20,8 @@ RRECOMMENDS_${PN}-ptest += "ptest-runner"
 
 PACKAGES =+ "${@bb.utils.contains('PTEST_ENABLED', '1', '${PN}-ptest', '', d)}"
 
+require conf/distro/include/ptest-packagelists.inc
+
 do_configure_ptest() {
     :
 }
@@ -116,4 +118,13 @@ python () {
     if not(d.getVar('PTEST_ENABLED') == "1"):
         for i in ['do_configure_ptest_base', 'do_compile_ptest_base', 'do_install_ptest_base']:
             bb.build.deltask(i, d)
+
+    # This checks that ptest package is actually included
+    # in standard oe-core ptest images - only for oe-core recipes
+    if not 'meta/recipes' in d.getVar('FILE') or not(d.getVar('PTEST_ENABLED') == "1"):
+        return
+
+    enabled_ptests = " ".join([d.getVar('PTESTS_FAST'),d.getVar('PTESTS_SLOW'), d.getVar('PTESTS_PROBLEMS')]).split()
+    if d.getVar('PN') + "-ptest" not in enabled_ptests:
+         bb.error("Recipe %s supports ptests but is not included in oe-core's conf/distro/include/ptest-packagelists.inc" % d.getVar("PN"))
 }
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index e0a876dbdc..953d2d6c43 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -14,17 +14,22 @@ PTESTS_FAST = "\
     diffutils-ptest \
     elfutils-ptest \
     ethtool-ptest \
+    expat-ptest \
     flex-ptest \
     gawk-ptest \
     gdbm-ptest \
     gdk-pixbuf-ptest \
     gettext-ptest \
+    glib-networking-ptest \
     gzip-ptest \
     json-glib-ptest \
     libconvert-asn1-perl-ptest \
     liberror-perl-ptest \
+    libnl-ptest \
     libmodule-build-perl-ptest \
+    libpam-ptest \
     libpcre-ptest \
+    libssh2-ptest \
     libtimedate-perl-ptest \
     libtest-needs-perl-ptest \
     liburi-perl-ptest \
@@ -43,6 +48,12 @@ PTESTS_FAST = "\
     opkg-ptest \
     pango-ptest \
     parted-ptest \
+    python3-atomicwrites-ptest \
+    python3-jinja2-ptest \
+    python3-markupsafe-ptest \
+    python3-more-itertools-ptest \
+    python3-pluggy-ptest \
+    python3-wcwidth-ptest \
     qemu-ptest \
     quilt-ptest \
     sed-ptest \
@@ -51,17 +62,7 @@ PTESTS_FAST = "\
     zlib-ptest \
 "
 PTESTS_FAST_remove_mips64 = "qemu-ptest"
-
-#PTESTS_PROBLEMS = "\
-#    ruby-ptest \ # Timeout
-#    clutter-1.0-ptest \ # Doesn't build due to depends on cogl-1.0
-#    lz4-ptest \ # Needs a rewrite
-#    rt-tests-ptest \ # Needs to be checked whether it runs at all
-#    bash-ptest \ # Test outcomes are non-deterministic by design
-#    ifupdown-ptest \ # Tested separately in lib/oeqa/selftest/cases/imagefeatures.py
-#    mdadm-ptest \ # Tests rely on non-deterministic sleep() amounts
-#    libinput-ptest \ # Tests need an unloaded system to be reliable
-#"
+PTESTS_PROBLEMS_append_mips64 = "qemu-ptest"
 
 PTESTS_SLOW = "\
     babeltrace-ptest \
@@ -85,3 +86,30 @@ PTESTS_SLOW = "\
 "
 
 PTESTS_SLOW_remove_riscv64 = "valgrind-ptest"
+PTESTS_PROBLEMS_append_riscv64 = "valgrind-ptest"
+
+#    ruby-ptest \ # Timeout
+#    clutter-1.0-ptest \ # Doesn't build due to depends on cogl-1.0
+#    lz4-ptest \ # Needs a rewrite
+#    rt-tests-ptest \ # Needs to be checked whether it runs at all
+#    bash-ptest \ # Test outcomes are non-deterministic by design
+#    ifupdown-ptest \ # Tested separately in lib/oeqa/selftest/cases/imagefeatures.py
+#    mdadm-ptest \ # Tests rely on non-deterministic sleep() amounts
+#    libinput-ptest \ # Tests need an unloaded system to be reliable
+#    numactl-ptest \ # qemu not (yet) configured for numa; all tests are skipped
+#    libseccomp-ptest \ #  tests failed: 38; add to slow tests once addressed
+#    python3-numpy-ptest \ # requires even more RAM and (possibly) disk space; multiple failures
+
+PTESTS_PROBLEMS = "\
+    ruby-ptest \
+    clutter-1.0-ptest \
+    lz4-ptest \
+    rt-tests-ptest \
+    bash-ptest \
+    ifupdown-ptest \
+    mdadm-ptest \
+    libinput-ptest \
+    libseccomp-ptest \
+    numactl-ptest \
+    python3-numpy-ptest \
+"
-- 
2.31.1

