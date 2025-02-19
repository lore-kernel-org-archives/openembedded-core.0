Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94AEBC021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 18:51:45 +0000 (UTC)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
 by mx.groups.io with SMTP id smtpd.web10.30783.1739991097149255711
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 10:51:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eQdVtRXG;
 spf=pass (domain: gmail.com, ip: 209.85.221.178, mailfrom: festevam@gmail.com)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-520a473d2adso69243e0c.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 10:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739991096; x=1740595896; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q3oZE5H3iCEj01/xPGH5I8q1q3Jj9KkXO+7nJ7nFn+c=;
        b=eQdVtRXGbkOZhUfnRf+Iz2aWJq1KDb+YF5xi1H+1vjqTLGeJLywEU7bvzn4KsFYGQ3
         Pw3PnL8UOCAYcy/pwkJcDsFyD015e100fAhc//baQP1NntwNseD1s+hwswT+A410Esdl
         tdkG8LBfEalWHxJDpBzXPng+Rw9WE+ocgyG3oto7rTwqu7UIcT9iuZWZ5y9J/qgp2w00
         /8pslgjMhnUHY/iVDjr2HRp+TPhmg+J2oouEfhED/uuzmD+BzzX/kg8Hnt3hUUq0ygM5
         SNczf+RAv5GQLq0UocYXPYkhy4pqwwiTG6YGsg4STezJGSDpqmGDM6OKVS2E/BBX7pQ2
         9QVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739991096; x=1740595896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q3oZE5H3iCEj01/xPGH5I8q1q3Jj9KkXO+7nJ7nFn+c=;
        b=VU/9DD1RzqJIoB5fwxuwCSe4cbXMdNvWeS/Wl/H8sDW75JbISWfGnis4LQgavuZbeS
         M4Z6ux9WxWM4Jny0NhjTZsi0JHoq1ZArj+mshb1AFnDE1D2UN+kl038p0Kp63rQvj5uJ
         gZRJ5fBnTmbt3ABs/cAiIgfeSYG118FLfbOv2G9PxapjMwIlXLDFh8WOXRBV7kRDPGfg
         +lHiN2tc7OqiC7uNZqACB1CV2lnGbNhJhNtprkabC/Crgur73+mjYgRpkFE4leXm+OwS
         1W+ymwmkOw/6as5zYf2FJCgDUQNK38Kpv2ubJ358aEoFkK5DR0W9Y4Q6/tuNhNhTa1O7
         yrHg==
X-Gm-Message-State: AOJu0Yz4Om7MgncOHW09un1qvlN9CTvBQeDjE/5oHt3x79mtvw5+SH0a
	oGgDEpB52YrrSzyKqBpdwzBnh9uKxEbTwS9caTgqX4koOVOFkbkOuxbEVQ==
X-Gm-Gg: ASbGnct/p12bdtZjNMIGm4z1NL8dx+f9Npe2d1mEW44DzCriLKXdUg53+eaDvfG83+N
	Ju7J5ipHfiFS/XjlwseIphR0Z1bsRFMiNFddypP7y2u3GXM6cF8Bp3kKABUMljhaPb2e7MCE5PP
	MUtNGTacUX8G5hxQm+nYYocsn+Dbg3n6sLSe7Ggu1bTP5QcXMRAUuP2xtchArlsjsaQcy5wrkoQ
	f1ZwIcaINSewlR780THve3q49FVbMT6ZxA8B6xHOFgKfjJ5quHEjRdBQ8AlrUH2Mriy52Mk3/Bf
	C0u/jSQKrEP4JXayPWRdODF76HgOlQ==
X-Google-Smtp-Source: AGHT+IF6ckQ+VfSofT3dwC78daVFiao/gX67azTFqshMx5PAbYHiWTvlyr0I2AgR4FR/fBSiUCqm6g==
X-Received: by 2002:a05:6122:328f:b0:520:3d87:5cdb with SMTP id 71dfb90a1353d-521c465180cmr3466321e0c.9.1739991095648;
        Wed, 19 Feb 2025 10:51:35 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:9a27:2e77:89d4:5724])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52085b489bbsm3087187e0c.42.2025.02.19.10.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 10:51:34 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 1/2] libexecinfo: Move it to the core
Date: Wed, 19 Feb 2025 15:51:18 -0300
Message-Id: <20250219185119.2168718-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 18:51:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211726

Move the libexecinfo recipe from meta-openembedded to meta-oe.

The motivation for doing this is building mtd-utils 2.3.0 with musl.

Musl requires an external libexecinfo to provide backtrace support.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v2:
- Use Upstream-Status: Inactive-Upstream. (Alexander)

 meta/conf/distro/include/maintainers.inc      |  1 +
 .../0001-makefile-Fix-build-on-linux.patch    | 60 ++++++++++++++
 ...piler-errors-found-with-newer-gcc-cl.patch | 79 +++++++++++++++++++
 meta/recipes-core/musl/libexecinfo_1.1.bb     | 30 +++++++
 4 files changed, 170 insertions(+)
 create mode 100644 meta/recipes-core/musl/libexecinfo/0001-makefile-Fix-build-on-linux.patch
 create mode 100644 meta/recipes-core/musl/libexecinfo/0002-execinfo-Fix-compiler-errors-found-with-newer-gcc-cl.patch
 create mode 100644 meta/recipes-core/musl/libexecinfo_1.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index e85a0c9563..c9885e7253 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -333,6 +333,7 @@ RECIPE_MAINTAINER:pn-libepoxy = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-liberation-fonts = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libevdev = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libevent = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER:pn-libexecinfo = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libexif = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libfakekey = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libffi = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-core/musl/libexecinfo/0001-makefile-Fix-build-on-linux.patch b/meta/recipes-core/musl/libexecinfo/0001-makefile-Fix-build-on-linux.patch
new file mode 100644
index 0000000000..d4894c4256
--- /dev/null
+++ b/meta/recipes-core/musl/libexecinfo/0001-makefile-Fix-build-on-linux.patch
@@ -0,0 +1,60 @@
+From 910bbc2cb6cc1cfa6deed9d170da02a639902c7c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 19 Mar 2017 16:14:54 -0700
+Subject: [PATCH 1/2] makefile: Fix build on linux
+
+Upstream-Status: Inactive-Upstream [no update since 2017, no maintainer: https://www.freshports.org/devel/libexecinfo]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 33 +++++++++++++++++----------------
+ 1 file changed, 17 insertions(+), 16 deletions(-)
+
+Index: libexecinfo-1.1/Makefile
+===================================================================
+--- libexecinfo-1.1.orig/Makefile
++++ libexecinfo-1.1/Makefile
+@@ -23,24 +23,25 @@
+ # SUCH DAMAGE.
+ #
+ # $Id: Makefile,v 1.3 2004/07/19 05:19:55 sobomax Exp $
++#
++# Linux Makefile by Matt Smith <mcs@darkregion.net>, 2011/01/04
+
+-LIB=	execinfo
+-
+-SRCS=	stacktraverse.c stacktraverse.h execinfo.c execinfo.h
+-
+-INCS=	execinfo.h
+-
+-SHLIB_MAJOR=	1
+-SHLIB_MINOR=	0
+-
+-NOPROFILE=	yes
+-
+-DPADD=		${LIBM}
+-LDADD=		-lm
+-
+-#WARNS?=	4
+-
+-#stacktraverse.c: gen.py
+-#	./gen.py > stacktraverse.c
++CC?=cc
++AR?=ar
++EXECINFO_CFLAGS=$(CFLAGS) -O2 -pipe -fno-strict-aliasing -std=gnu99 -fstack-protector -c
++EXECINFO_LDFLAGS=$(LDFLAGS)
++
++all: static dynamic
++
++static:
++	$(CC) $(EXECINFO_CFLAGS) $(EXECINFO_LDFLAGS) stacktraverse.c
++	$(CC) $(EXECINFO_CFLAGS) $(EXECINFO_LDFLAGS) execinfo.c
++	$(AR) rcs libexecinfo.a stacktraverse.o execinfo.o
++
++dynamic:
++	$(CC) -fpic -DPIC $(EXECINFO_CFLAGS) $(EXECINFO_LDFLAGS) stacktraverse.c -o stacktraverse.So
++	$(CC) -fpic -DPIC $(EXECINFO_CFLAGS) $(EXECINFO_LDFLAGS) execinfo.c -o execinfo.So
++	$(CC) -shared -Wl,-soname,libexecinfo.so.1 -o libexecinfo.so.1 $(EXECINFO_LDFLAGS) stacktraverse.So execinfo.So
+
+-.include <bsd.lib.mk>
++clean:
++	rm -rf *.o *.So *.a *.so
diff --git a/meta/recipes-core/musl/libexecinfo/0002-execinfo-Fix-compiler-errors-found-with-newer-gcc-cl.patch b/meta/recipes-core/musl/libexecinfo/0002-execinfo-Fix-compiler-errors-found-with-newer-gcc-cl.patch
new file mode 100644
index 0000000000..914928d924
--- /dev/null
+++ b/meta/recipes-core/musl/libexecinfo/0002-execinfo-Fix-compiler-errors-found-with-newer-gcc-cl.patch
@@ -0,0 +1,79 @@
+From 0810817773fb81d7383d2fa8464244c8f79845fb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 19 Mar 2017 16:16:18 -0700
+Subject: [PATCH 2/2] execinfo: Fix compiler errors found with newer gcc/clang
+
+Upstream-Status: Inactive-Upstream [no update since 2017, no maintainer: https://www.freshports.org/devel/libexecinfo]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ execinfo.c | 19 +++++++++++--------
+ 1 file changed, 11 insertions(+), 8 deletions(-)
+
+diff --git a/execinfo.c b/execinfo.c
+index 906fb14..9448b60 100644
+--- a/execinfo.c
++++ b/execinfo.c
+@@ -69,7 +69,8 @@ backtrace(void **buffer, int size)
+ char **
+ backtrace_symbols(void *const *buffer, int size)
+ {
+-    int i, clen, alen, offset;
++    size_t clen, alen;
++    int i, offset;
+     char **rval;
+     char *cp;
+     Dl_info info;
+@@ -78,7 +79,6 @@ backtrace_symbols(void *const *buffer, int size)
+     rval = malloc(clen);
+     if (rval == NULL)
+         return NULL;
+-    (char **)cp = &(rval[size]);
+     for (i = 0; i < size; i++) {
+         if (dladdr(buffer[i], &info) != 0) {
+             if (info.dli_sname == NULL)
+@@ -92,14 +92,14 @@ backtrace_symbols(void *const *buffer, int size)
+                    2 +                      /* " <" */
+                    strlen(info.dli_sname) + /* "function" */
+                    1 +                      /* "+" */
+-                   D10(offset) +            /* "offset */
++                   10 +                     /* "offset */
+                    5 +                      /* "> at " */
+                    strlen(info.dli_fname) + /* "filename" */
+                    1;                       /* "\0" */
+             rval = realloc_safe(rval, clen + alen);
+             if (rval == NULL)
+                 return NULL;
+-            snprintf(cp, alen, "%p <%s+%d> at %s",
++            snprintf((char *) rval + clen, alen, "%p <%s+%d> at %s",
+               buffer[i], info.dli_sname, offset, info.dli_fname);
+         } else {
+             alen = 2 +                      /* "0x" */
+@@ -108,12 +108,15 @@ backtrace_symbols(void *const *buffer, int size)
+             rval = realloc_safe(rval, clen + alen);
+             if (rval == NULL)
+                 return NULL;
+-            snprintf(cp, alen, "%p", buffer[i]);
++            snprintf((char *) rval + clen, alen, "%p", buffer[i]);
+         }
+-        rval[i] = cp;
+-        cp += alen;
++        rval[i] = (char *) clen;
++        clen += alen;
+     }
+
++    for (i = 0; i < size; i++)
++        rval[i] += (long) rval;
++
+     return rval;
+ }
+
+@@ -155,6 +158,6 @@ backtrace_symbols_fd(void *const *buffer, int size, int fd)
+                 return;
+             snprintf(buf, len, "%p\n", buffer[i]);
+         }
+-        write(fd, buf, len - 1);
++        write(fd, buf, strlen(buf));
+     }
+ }
+--
+2.12.0
diff --git a/meta/recipes-core/musl/libexecinfo_1.1.bb b/meta/recipes-core/musl/libexecinfo_1.1.bb
new file mode 100644
index 0000000000..3711ceeebd
--- /dev/null
+++ b/meta/recipes-core/musl/libexecinfo_1.1.bb
@@ -0,0 +1,30 @@
+# Copyright (C) 2017 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "Library for inspecting program's backtrace"
+DESCRIPTION = "A quick-n-dirty BSD licensed clone of the GNU libc backtrace facility."
+HOMEPAGE = "http://www.freshports.org/devel/libexecinfo"
+LIC_FILES_CHKSUM = "file://execinfo.c;endline=25;md5=85bd3fa4ea9acae5182e29db063fe2e5"
+LICENSE = "BSD-2-Clause"
+SECTION = "libs"
+DEPENDS = ""
+
+SRC_URI = "http://distcache.freebsd.org/local-distfiles/itetcu/${BP}.tar.bz2 \
+           file://0001-makefile-Fix-build-on-linux.patch \
+           file://0002-execinfo-Fix-compiler-errors-found-with-newer-gcc-cl.patch \
+           "
+SRC_URI[sha256sum] = "c9a21913e7fdac8ef6b33250b167aa1fc0a7b8a175145e26913a4c19d8a59b1f"
+
+CFLAGS += "-fno-omit-frame-pointer  -D_GNU_SOURCE"
+
+do_install() {
+    install -D -m 0744 ${S}/execinfo.h ${D}${includedir}/execinfo.h
+    install -D -m 0744 ${S}/stacktraverse.h ${D}${includedir}/stacktraverse.h
+    install -D -m 0744 ${B}/libexecinfo.a ${D}${libdir}/libexecinfo.a
+    install -D -m 0755 ${B}/libexecinfo.so.1 ${D}${libdir}/libexecinfo.so.1
+    ln -s libexecinfo.so.1 ${D}${libdir}/libexecinfo.so
+}
+#
+# We will skip parsing for non-musl systems
+#
+COMPATIBLE_HOST = ".*-musl.*"
-- 
2.40.1


