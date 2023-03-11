Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D804C7618E
	for <webhook@archiver.kernel.org>; Sat, 11 Mar 2023 22:42:09 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.55887.1678574522739811392
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Mar 2023 14:42:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EtaT9sSh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id t25-20020a1c7719000000b003eb052cc5ccso8476753wmi.4
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 14:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678574521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vXbVupZpOuutc0zm/GN7XSLVTTYeQda/cV1fjk9B4c0=;
        b=EtaT9sShz0Gxg7GocMPLYLerin0nBf0YOlXuUKuQ8xF3OeKJ7xqI8e4nx+2yY1GuR2
         LN88LECsQf5bUUAHdCxurDzHlB+nZlU08/Q74ANITc8by3bV5FRQERc+g1i6FvtlKvS+
         fNCYeX+kYfVHFv9XuAyOWLDfotqe3YTB4v2Ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678574521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXbVupZpOuutc0zm/GN7XSLVTTYeQda/cV1fjk9B4c0=;
        b=1VyfVvGcjbiw3VU744XAHYLaPUJbyfmYEaeXLQpGfRbISRTv7S22z1J0vkE2tQgcwF
         EL234j00Neh9RX4uzlQUQuCxOUIQgEq+aIBV887qlGbJkeJwAIWgfb1s0wYcNpVAKxhA
         B7xmIriBm2O23XRS28DwCzgpZmcPPzanUSzMNiLLXkvjGmj+gh+IWGOCc7eBp0bp5WJ8
         iJIDDFewmSlMe/h8kQ/MfHsyEituru04Js2iyexKkP1ZcYywjTmoT6RBI6963gqe2ecB
         ZnrhFTgUULTiwknwcD9yHCZbkZcg3MEs8B4e7+pvIKfKa5OcjgLb8RdXhd2EF0Gt4uOL
         91YQ==
X-Gm-Message-State: AO0yUKWj2cVl6WM5nDojqJBW3lG3jdkgDxOJoGYTFmJZcTZ/IsCRjTz+
	UMKYQ+HF6D+KKK3HzJ7mrrXJ++xaXvxkJOBbfFQ=
X-Google-Smtp-Source: AK7set8Jc18y9cD4i/Lk2Qz5J+29kbyzuZvpCOGjKwEFcWO/V/xC/VuMWnmK3uiEU8wX68rxdVXoYg==
X-Received: by 2002:a05:600c:34c1:b0:3eb:383c:1876 with SMTP id d1-20020a05600c34c100b003eb383c1876mr6597927wmq.6.1678574520935;
        Sat, 11 Mar 2023 14:42:00 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9dd5:bdbf:ef9d:c118])
        by smtp.gmail.com with ESMTPSA id z9-20020a05600c114900b003dc5b59ed7asm3933164wmz.11.2023.03.11.14.42.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 14:42:00 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] ptest-packagelists: Simplify ptest list/code
Date: Sat, 11 Mar 2023 22:41:55 +0000
Message-Id: <20230311224155.3442306-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230311224155.3442306-1-richard.purdie@linuxfoundation.org>
References: <20230311224155.3442306-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 22:42:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178374

All the usage sites remove the -ptest suffix. Simply the original list
instead and clean up the code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/ptest.bbclass             |   2 +-
 .../distro/include/ptest-packagelists.inc     | 250 +++++++++---------
 .../images/core-image-ptest-all.bb            |   4 +-
 meta/recipes-core/images/core-image-ptest.bb  |   2 +-
 4 files changed, 129 insertions(+), 129 deletions(-)

diff --git a/meta/classes-recipe/ptest.bbclass b/meta/classes-recipe/ptest.bbclass
index 0383206a6dd..a1c3c3f1a65 100644
--- a/meta/classes-recipe/ptest.bbclass
+++ b/meta/classes-recipe/ptest.bbclass
@@ -138,5 +138,5 @@ def package_qa_check_missing_ptest(pn, d, messages):
         return
 
     enabled_ptests = " ".join([d.getVar('PTESTS_FAST'), d.getVar('PTESTS_SLOW'), d.getVar('PTESTS_PROBLEMS')]).split()
-    if (pn + "-ptest").replace(d.getVar('MLPREFIX'), '') not in enabled_ptests:
+    if pn.replace(d.getVar('MLPREFIX'), '') not in enabled_ptests:
         oe.qa.handle_error("missing-ptest", "supports ptests but is not included in oe-core's ptest-packagelists.inc", d)
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 0681b4b7a23..d60ebb38fc8 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -4,137 +4,137 @@
 # ptests which take less than ~30s each
 #
 PTESTS_FAST = "\
-    acl-ptest \
-    apr-util-ptest \
-    attr-ptest \
-    babeltrace-ptest \
-    babeltrace2-ptest \
-    bc-ptest \
-    bluez5-ptest \
-    busybox-ptest \
-    cpio-ptest \
-    diffstat-ptest \
-    diffutils-ptest \
-    ethtool-ptest \
-    expat-ptest \
-    findutils-ptest \
-    flex-ptest \
-    gawk-ptest \
-    gdbm-ptest \
-    gdk-pixbuf-ptest \
-    glib-networking-ptest \
-    gzip-ptest \
-    json-c-ptest \
-    json-glib-ptest \
-    libconvert-asn1-perl-ptest \
-    liberror-perl-ptest \
-    libgpg-error-ptest\
-    libnl-ptest \
-    libpcre-ptest \
-    libssh2-ptest \
-    libtimedate-perl-ptest \
-    libtest-fatal-perl-ptest \
-    libtest-needs-perl-ptest \
-    libtest-warnings-perl-ptest \
-    libtry-tiny-perl-ptest \
-    liburi-perl-ptest \
-    libusb1-ptest \
-    libxml-namespacesupport-perl-ptest \
-    libxml-perl-ptest \
-    libxml-parser-perl-ptest \
-    libxml-sax-perl-ptest \
-    libxml-sax-base-perl-ptest \
-    libxml-simple-perl-ptest \
-    libxml2-ptest \
-    lua-ptest \
-    lzo-ptest \
-    m4-ptest \
-    nettle-ptest \
-    opkg-ptest \
-    pango-ptest \
-    popt-ptest \
-    python3-atomicwrites-ptest \
-    python3-bcrypt-ptest \
-    python3-hypothesis-ptest \
-    python3-jinja2-ptest \
-    python3-jsonpointer-ptest \
-    python3-markupsafe-ptest \
-    python3-more-itertools-ptest \
-    python3-pluggy-ptest \
-    python3-pyasn1-ptest \
-    python3-pytz-ptest \
-    python3-wcwidth-ptest \
-    python3-webcolors-ptest \
-    qemu-ptest \
-    quilt-ptest \
-    sed-ptest \
-    slang-ptest \
-    wayland-ptest \
-    zlib-ptest \
+    acl \
+    apr-util \
+    attr \
+    babeltrace \
+    babeltrace2 \
+    bc \
+    bluez5 \
+    busybox \
+    cpio \
+    diffstat \
+    diffutils \
+    ethtool \
+    expat \
+    findutils \
+    flex \
+    gawk \
+    gdbm \
+    gdk-pixbuf \
+    glib-networking \
+    gzip \
+    json-c \
+    json-glib \
+    libconvert-asn1-perl \
+    liberror-perl \
+    libgpg-error\
+    libnl \
+    libpcre \
+    libssh2 \
+    libtimedate-perl \
+    libtest-fatal-perl \
+    libtest-needs-perl \
+    libtest-warnings-perl \
+    libtry-tiny-perl \
+    liburi-perl \
+    libusb1 \
+    libxml-namespacesupport-perl \
+    libxml-perl \
+    libxml-parser-perl \
+    libxml-sax-perl \
+    libxml-sax-base-perl \
+    libxml-simple-perl \
+    libxml2 \
+    lua \
+    lzo \
+    m4 \
+    nettle \
+    opkg \
+    pango \
+    popt \
+    python3-atomicwrites \
+    python3-bcrypt \
+    python3-hypothesis \
+    python3-jinja2 \
+    python3-jsonpointer \
+    python3-markupsafe \
+    python3-more-itertools \
+    python3-pluggy \
+    python3-pyasn1 \
+    python3-pytz \
+    python3-wcwidth \
+    python3-webcolors \
+    qemu \
+    quilt \
+    sed \
+    slang \
+    wayland \
+    zlib \
 "
-PTESTS_FAST:append:libc-glibc = " glibc-tests-ptest"
-PTESTS_PROBLEMS:remove:libc-glibc = "glibc-tests-ptest"
-PTESTS_FAST:remove:mips64 = "qemu-ptest"
-PTESTS_PROBLEMS:append:mips64 = " qemu-ptest"
-PTESTS_FAST:remove:riscv32 = "qemu-ptest"
-PTESTS_PROBLEMS:append:riscv32 = " qemu-ptest"
+PTESTS_FAST:append:libc-glibc = " glibc-tests"
+PTESTS_PROBLEMS:remove:libc-glibc = "glibc-tests"
+PTESTS_FAST:remove:mips64 = "qemu"
+PTESTS_PROBLEMS:append:mips64 = " qemu"
+PTESTS_FAST:remove:riscv32 = "qemu"
+PTESTS_PROBLEMS:append:riscv32 = " qemu"
 
 PTESTS_SLOW = "\
-    apr-ptest \
-    bzip2-ptest \
-    coreutils-ptest \
-    curl-ptest \
-    dbus-ptest \
-    e2fsprogs-ptest \
-    elfutils-ptest \
-    gettext-ptest \
-    glib-2.0-ptest \
-    gnutls-ptest \
-    gstreamer1.0-ptest \
-    libevent-ptest \
-    libgcrypt-ptest \
-    libmodule-build-perl-ptest \
-    lttng-tools-ptest \
-    openssh-ptest \
-    openssl-ptest \
-    parted-ptest \
-    perl-ptest \
-    python3-cryptography-ptest \
-    python3-ptest \
-    strace-ptest \
-    tcl-ptest \
-    util-linux-ptest \
-    valgrind-ptest \
+    apr \
+    bzip2 \
+    coreutils \
+    curl \
+    dbus \
+    e2fsprogs \
+    elfutils \
+    gettext \
+    glib-2.0 \
+    gnutls \
+    gstreamer1.0 \
+    libevent \
+    libgcrypt \
+    libmodule-build-perl \
+    lttng-tools \
+    openssh \
+    openssl \
+    parted \
+    perl \
+    python3-cryptography \
+    python3 \
+    strace \
+    tcl \
+    util-linux \
+    valgrind \
 "
 
-PTESTS_SLOW:remove:riscv64 = "valgrind-ptest"
-PTESTS_PROBLEMS:append:riscv64 = " valgrind-ptest"
-PTESTS_SLOW:append:libc-musl = " libc-test-ptest"
-PTESTS_SLOW:remove:x86 = "valgrind-ptest"
-PTESTS_PROBLEMS:append:x86 = " valgrind-ptest"
+PTESTS_SLOW:remove:riscv64 = "valgrind"
+PTESTS_PROBLEMS:append:riscv64 = " valgrind"
+PTESTS_SLOW:append:libc-musl = " libc-test"
+PTESTS_SLOW:remove:x86 = "valgrind"
+PTESTS_PROBLEMS:append:x86 = " valgrind"
 
-#    ruby-ptest \ # Timeout
-#    lz4-ptest \ # Needs a rewrite
-#    rt-tests-ptest \ # Needs to be checked whether it runs at all
-#    bash-ptest \ # Test outcomes are non-deterministic by design
-#    ifupdown-ptest \ # Tested separately in lib/oeqa/selftest/cases/imagefeatures.py
-#    mdadm-ptest \ # Tests rely on non-deterministic sleep() amounts
-#    libinput-ptest \ # Tests need an unloaded system to be reliable
-#    libpam-ptest \ # Needs pam DISTRO_FEATURE
-#    numactl-ptest \ # qemu not (yet) configured for numa; all tests are skipped
-#    libseccomp-ptest \ #  tests failed: 38; add to slow tests once addressed
-#    python3-numpy-ptest \ # requires even more RAM and (possibly) disk space; multiple failures
+#    ruby \ # Timeout
+#    lz4 \ # Needs a rewrite
+#    rt-tests \ # Needs to be checked whether it runs at all
+#    bash \ # Test outcomes are non-deterministic by design
+#    ifupdown \ # Tested separately in lib/oeqa/selftest/cases/imagefeatures.py
+#    mdadm \ # Tests rely on non-deterministic sleep() amounts
+#    libinput \ # Tests need an unloaded system to be reliable
+#    libpam \ # Needs pam DISTRO_FEATURE
+#    numactl \ # qemu not (yet) configured for numa; all tests are skipped
+#    libseccomp \ #  tests failed: 38; add to slow tests once addressed
+#    python3-numpy \ # requires even more RAM and (possibly) disk space; multiple failures
 
 PTESTS_PROBLEMS = "\
-    ruby-ptest \
-    lz4-ptest \
-    rt-tests-ptest \
-    bash-ptest \
-    ifupdown-ptest \
-    mdadm-ptest \
-    libinput-ptest \
-    libpam-ptest \
-    libseccomp-ptest \
-    numactl-ptest \
-    python3-numpy-ptest \
+    ruby \
+    lz4 \
+    rt-tests \
+    bash \
+    ifupdown \
+    mdadm \
+    libinput \
+    libpam \
+    libseccomp \
+    numactl \
+    python3-numpy \
 "
diff --git a/meta/recipes-core/images/core-image-ptest-all.bb b/meta/recipes-core/images/core-image-ptest-all.bb
index 1a3e979d7e3..a912fa7ef66 100644
--- a/meta/recipes-core/images/core-image-ptest-all.bb
+++ b/meta/recipes-core/images/core-image-ptest-all.bb
@@ -13,6 +13,6 @@ PTESTS = "${PTESTS_FAST} ${PTESTS_SLOW}"
 
 addtask do_testimage
 do_testimage[noexec] = "1"
-do_testimage[depends] = "${@' '.join(['core-image-ptest-'+x.replace('-ptest', '')+':do_testimage' for x in d.getVar('PTESTS').split()])}"
+do_testimage[depends] = "${@' '.join(['core-image-ptest-'+x+':do_testimage' for x in d.getVar('PTESTS').split()])}"
 
-do_build[depends] = "${@' '.join(['core-image-ptest-'+x.replace('-ptest', '')+':do_build' for x in d.getVar('PTESTS').split()])}"
+do_build[depends] = "${@' '.join(['core-image-ptest-'+x+':do_build' for x in d.getVar('PTESTS').split()])}"
diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
index 0c67943b057..90c26641ba3 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -11,7 +11,7 @@ PTESTS = "${PTESTS_SLOW} ${PTESTS_FAST}"
 
 IMAGE_INSTALL:append = " ${MCNAME}-ptest openssh"
 
-BBCLASSEXTEND = "${@' '.join(['mcextend:'+x.replace('-ptest', '') for x in d.getVar('PTESTS').split()])}"
+BBCLASSEXTEND = "${@' '.join(['mcextend:'+x for x in d.getVar('PTESTS').split()])}"
 
 # The image can sufficiently large (~1.8GB) that we need to be careful that it fits in a live
 # image (which has a 4GB limit), so nullify the overhead factor (1.3x out of the
-- 
2.38.1


