Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.7072.1615894723626510237
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Mar 2021 04:38:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dfVEq9Fn;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id d139-20020a1c1d910000b029010b895cb6f2so1249260wmd.5
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Mar 2021 04:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T0CwuEYNnjQvDPAWYXKdfQnTDzFNK9lbuBANaDJ3OqE=;
        b=dfVEq9FnBmY6DHjx9QZwmtXR0iJkMsEu39t0Ka9HTruGlLje6AhEukdsnQ1N2VFFu0
         SWU62zFprcBuTbpBBNPTW3fQbQKfjYOMIp2jLFKO34Ae6AT1XmQN1/Vf3v6/EzLwjDrw
         FbeKVtBZ/gbpwGJNmBhZ6gwBpjTeFDrxyCeyHkwzQAZG59O0kLRl+vy8nlS8TkxygQC+
         sxVnqtuZn84aGwRjvW+Ks2J3BC7HPEYKHO6VUuKlyk2vXZTtX8dh44C3X4gLNZ+lXMkA
         jhelzF8EmkabqhOhmE4931AVUhQL+TKlrGQG7ryCiHiL7VMQ6CkXZcHCRBlVN2rAhBjI
         RvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T0CwuEYNnjQvDPAWYXKdfQnTDzFNK9lbuBANaDJ3OqE=;
        b=Ti9bBI7hwicfxPVzz3wFMdD7yKIkzXwkCoodKap/XA0+uFezCQ8xJgpqP50czJY0Y1
         oXvFzjiNyus8VxV3fj59QkP+bX3Sj5FoiYQrM1scYrqQJq/LNyPoqLd6MYIAo/qJguGG
         Fp/W8p4uE4/UZQHdZN6fOI/ennPwT4uY6DwQkagTAVLijrB4XfwjxE25enAEhhHg61LZ
         IDVKOv5/sz+sGgWM0nWWnm+xs4HYPWIJWXv6kakPCGsF/dUHLbK4a6fxOu5zIVoZ2k2c
         Xc/k1dLxEcSdkA9os0fjUQRZJkuIg4URCA3Krbhaehf8r7GfiWhmLF0A9KA+0vAw+ipE
         ysVA==
X-Gm-Message-State: AOAM533WJoG5jdOiuqhHvr9xZPaHNwtdkPEfgLeOXsTGzfS1GKkBXD5V
	9f+0W9voJ1nXlxuWy4CQnIZgQXx/WWE=
X-Google-Smtp-Source: ABdhPJycProEcDbyMk2Vy2pODchO/15yvYyi9LyHg+31kuJRhOnzvsN01Nhhrn0mlPFneNUqKUm+2A==
X-Received: by 2002:a05:600c:4ca9:: with SMTP id g41mr4334734wmp.150.1615894721729;
        Tue, 16 Mar 2021 04:38:41 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id 21sm2978652wme.6.2021.03.16.04.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 04:38:40 -0700 (PDT)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org
Subject: [PATCH v2] util-linux: backport patch to skip build of unused objects
Date: Tue, 16 Mar 2021 11:38:36 +0000
Message-Id: <20210316113836.1194859-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210316110159.1189143-1-luca.boccassi@gmail.com>
References: <20210316110159.1189143-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

util-linux-uuid does not need libtcolors.a and libcommon.a but
they get build regardless. Backport a patch from upstream to
skip them and save some compilation time.

https://github.com/karelzak/util-linux/commit/c65953d72bbc7412f32e566d9fa6e780d84f0696

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
autoconf is still the major bottleneck, but it's a tiny patch and it was
accepted upstream, so probably worth having even if it helps only a little

v2: add EXTRA_LTLIBRARIES to CLEANFILES, which does not happen automatically
    unlike noinst_LTLIBRARIES. Necessary for make distcheck.

 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 ...RA_LTLIBRARIES-instead-of-noinst_LTL.patch | 49 +++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index b4f817ed82..4031c586c9 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -37,5 +37,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.tar.xz
            file://run-ptest \
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
+           file://Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch \
            "
 SRC_URI[sha256sum] = "f7516ba9d8689343594356f0e5e1a5f0da34adfbc89023437735872bb5024c5f"
diff --git a/meta/recipes-core/util-linux/util-linux/Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch b/meta/recipes-core/util-linux/util-linux/Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch
new file mode 100644
index 0000000000..272518914e
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch
@@ -0,0 +1,49 @@
+Author: Luca Boccassi <luca.boccassi@microsoft.com>
+Description: Automake: use EXTRA_LTLIBRARIES instead of noinst_LTLIBRARIES
+ noinst_LTLIBRARIES causes the libraries to be always built
+ unconditionally. EXTRA_LTLIBRARIES causes them to be built
+ only if other build target needs them.
+ In other words, avoid building libcommon.a and libtcolors.a
+ unless they are needed by another library/executable and
+ save some build time.
+Upstream-Status: backport, commit:c65953d72bbc7412f32e566d9fa6e780d84f0696
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -39,7 +39,7 @@ bashcompletiondir = @bashcompletiondir@
+ 
+ dist_noinst_HEADERS =
+ noinst_PROGRAMS =
+-noinst_LTLIBRARIES =
++EXTRA_LTLIBRARIES =
+ usrbin_exec_PROGRAMS =
+ usrsbin_exec_PROGRAMS =
+ dist_man_MANS =
+@@ -169,7 +169,7 @@ else
+ edit_cmd += -e 's|@vendordir[@]||g'
+ endif
+ 
+-CLEANFILES += $(PATHFILES)
++CLEANFILES += $(PATHFILES) $(EXTRA_LTLIBRARIES)
+ EXTRA_DIST += $(PATHFILES:=.in)
+ 
+ $(PATHFILES): Makefile
+--- a/lib/Makemodule.am
++++ b/lib/Makemodule.am
+@@ -9,7 +9,7 @@
+ # Note that you need "make install-strip" (or proper rpm / Debian build)
+ # to generate binaries with only relevant stuff.
+ #
+-noinst_LTLIBRARIES += libcommon.la
++EXTRA_LTLIBRARIES += libcommon.la
+ libcommon_la_CFLAGS = $(AM_CFLAGS)
+ libcommon_la_SOURCES = \
+ 	lib/blkdev.c \
+@@ -59,7 +59,7 @@ libcommon_la_SOURCES += lib/sysfs.c
+ endif
+ endif
+ 
+-noinst_LTLIBRARIES += libtcolors.la
++EXTRA_LTLIBRARIES += libtcolors.la
+ libtcolors_la_CFLAGS = $(AM_CFLAGS)
+ libtcolors_la_SOURCES = lib/colors.c lib/color-names.c include/colors.h include/color-names.h
+ libtcolors_la_LIBADD =
-- 
2.29.2

