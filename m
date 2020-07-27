Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web12.57688.1595862647846720220
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 08:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=NF+wq6pg;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id k1so9554906pjt.5
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 08:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=BNoaTkwzfU6lWESlb8q0IkRw0CP0J2BC+Qhn6Tex+XE=;
        b=NF+wq6pgZNxVw6vmBtr/P9OJw7SobIUFeAC69dnQDrH1qLo+5tMK1B77qyRYT/JDPF
         Q1girQ0zCkRJRUbdfMM2QH6QSYEu6dC8rSZI0rqPQQ2erQf1oSZUf/V2AvRGnwlWmKFf
         SzlMPdXPkipsDjHrgqWgzor6andxjfdTjkfPBw/km+KBg9AoAWb36AFdibkzrDyDXEi+
         QE7n0izQlMQKDXJkCPQpVFe+O21W+Uri6rMp2IJEVW5nKrnhqAMI+xW8Gcv83xx29C0R
         pJdHz7qSH4bZc7hHycaCUZJDnxoT7ZBB+rnxul1YSFFfr/GQYPtSEQ7/9QgVuoq6Ypgl
         j7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=BNoaTkwzfU6lWESlb8q0IkRw0CP0J2BC+Qhn6Tex+XE=;
        b=TtTqAcuhuQrCMXmJ/u1yicrYXxExWgcCaMkB765BGEHLUnuJvqn0eh2PldO4/Qhu5x
         H2cf98z0lbk6zmuzPfsH/WJuJ6sdw25gnFTv6jcvvRSMag1ISGKwLzgbrdoAN+zJvGhw
         EL9F+NkGJBGwCgr7mCnv9hQ8FfBOINhaSLD3qWdF6kycE6Vmw4cZdzM7NpyrnGc1S1OY
         sHT6I/bcjzaqE5r1nLrdwjzNOpUESpI1u26OaE0BJ+B+7mOM7rIh+hpiAp4/obnMosqw
         yF1KSdvM7yO5fs1w9la51iivYbW8FKAZp/ZHf0qpBQEqngozxP9VMGYbNb/x8T7mpqRS
         HV5g==
X-Gm-Message-State: AOAM532WjAPQaEG4fI+0a9UEu2xK6w3rhYRDRo9zPP31BGSm13VaVJwp
	sZsiDKUrpsD1fpSlPnRZWau6U90lZPU=
X-Google-Smtp-Source: ABdhPJyeN45pDzPGsiaFtLU7TB8+wKvIfcTXUKYPDOXvHRf7X5q+iV3ZFw6hmV3BNhsLHMy12CpYjw==
X-Received: by 2002:a17:90b:4a0c:: with SMTP id kk12mr19214558pjb.153.1595862646744;
        Mon, 27 Jul 2020 08:10:46 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id p127sm14929495pfb.17.2020.07.27.08.10.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 08:10:45 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/18] core: glib-2.0: fix requested libmount/mkostemp/selinux not being linked in
Date: Mon, 27 Jul 2020 05:09:53 -1000
Message-Id: <1eb5483fea909177dd4f510ebcb32084d77897b3.1595862361.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1595862361.git.steve@sakoman.com>
References: <cover.1595862361.git.steve@sakoman.com>

From: Ahmad Fatoum <a.fatoum@pengutronix.de>

Since 010202076760 ("meson.bbclass: avoid unexpected operating-system
names"), meson is no longer used with a cross file that appends the used
libc to the operating system name, e.g. linux-gnueabi.

Prior to that commit, the host_system == 'linux' checks in glib's meson
failed, which led to glib being compiled without libmount, mkostemp and
selinux even if explicitly requested.

As the aforementioned commit affects all recipes built by glib, it might
not be a candidate for backporting to current stable branches. To fix
just the glib issue, instances of host_system == 'linux' are patched
locally.

The patch is marked as Upstream-Status: Inappropriate as it is rendered
unnecessary for OE releases newer than Dunfell.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ot-hardcode-linux-as-the-host-system.patch | 49 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0020-meson.build-do-not-hardcode-linux-as-the-host-system.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0020-meson.build-do-not-hardcode-linux-as-the-host-system.patch b/meta/recipes-core/glib-2.0/glib-2.0/0020-meson.build-do-not-hardcode-linux-as-the-host-system.patch
new file mode 100644
index 0000000000..616bbd8a7d
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0020-meson.build-do-not-hardcode-linux-as-the-host-system.patch
@@ -0,0 +1,49 @@
+From a300a09661124451d4783d4be66e3993262dc9be Mon Sep 17 00:00:00 2001
+From: Ahmad Fatoum <a.fatoum@pengutronix.de>
+Date: Thu, 9 Jul 2020 13:00:16 +0200
+Subject: [PATCH] meson.build: do not hardcode 'linux' as the host system
+
+OE build system can set this to other values that include 'linux',
+e.g. 'linux-gnueabi'. This led to glib always being built without
+libmount, mkostemp and selinux support.
+
+Upstream-Status: Inappropriate [other]
+Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
+---
+ meson.build | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 3a47a7cc4b98..af09dfc853e5 100644
+--- a/meson.build
++++ b/meson.build
+@@ -632,7 +632,7 @@ else
+ endif
+ message('Checking whether to use statfs or statvfs .. ' + stat_func_to_use)
+ 
+-if host_system == 'linux'
++if host_system.contains('linux')
+   if cc.has_function('mkostemp',
+                      prefix: '''#define _GNU_SOURCE
+                                 #include <stdlib.h>''')
+@@ -1857,7 +1857,7 @@ glib_conf.set_quoted('GLIB_LOCALE_DIR', join_paths(glib_datadir, 'locale'))
+ # libmount is only used by gio, but we need to fetch the libs to generate the
+ # pkg-config file below
+ libmount_dep = []
+-if host_system == 'linux' and get_option('libmount')
++if host_system.contains('linux') and get_option('libmount')
+   libmount_dep = [dependency('mount', version : '>=2.23', required : true)]
+   glib_conf.set('HAVE_LIBMOUNT', 1)
+ endif
+@@ -1867,7 +1867,7 @@ if host_system == 'windows'
+ endif
+ 
+ selinux_dep = []
+-if host_system == 'linux'
++if host_system.contains('linux')
+   selinux_dep = dependency('libselinux', required: get_option('selinux'))
+ 
+   glib_conf.set('HAVE_SELINUX', selinux_dep.found())
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
index d496235003..fd7f5ee920 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0011-GMainContext-Fix-GSource-iterator-if-iteration-can-m.patch \
            file://0012-GMainContext-Fix-memory-leaks-and-memory-corruption-.patch \
            file://0013-GMainContext-Move-mutex-unlocking-in-destructor-righ.patch \
+           file://0020-meson.build-do-not-hardcode-linux-as-the-host-system.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
-- 
2.17.1

