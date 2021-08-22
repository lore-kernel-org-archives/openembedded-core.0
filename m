Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.9603.1629636673392336508
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O8AxrJED;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id z4so6161039wrr.6
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZRiZ9/H7pWweMsRbQi/8nxR+K8hsePsk7gZAhlkS+4c=;
        b=O8AxrJED/fyvWyyrwd1Ynv7R6cA0NpeAL6tQmeqP7jUharq/GpO1tZfkbF+QqyTPEa
         MadDm23c1SULcAGr43vb7eHSq+/9pss66K7d9sa00VhI4yX32bJErdapg2Vsi/QBgy/c
         J9VQ/fEfc73nQ01XfTPNP5dc3vRJrjOqupfTVVJjinYNuf4hHE0FzMkvGgQvwzoQNg6s
         fePQ+ZwO+c7HUvlAos3F3z+zDwbO5bvrCoqRCwYfqDNl6tF0qPfGJ6/9cLN7pIISJZVa
         drNglNw/fF2tuzAm5uMUrWrlbDgdRbkwa3yUV8JLCHZ6G7dXJz1bG6ZMaFxste/gmG60
         BOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZRiZ9/H7pWweMsRbQi/8nxR+K8hsePsk7gZAhlkS+4c=;
        b=ix614rvQzJyY7CSrZQQGBqbmcgqtANRmEj06tkLDHe8S3GNjeN4Mp7PbVfCcL4GeVF
         Rut/LzYa1bReh9e/adfkP6BoIC8ly5myUq0qndwslQmoybUe1BBG1+OPT29WRYUAf4nj
         dHFKs8+v9kmf4z9IjCfWqTBk33gFOz/cMMdcSRa+5bzjZ7MAtdsejFk+ZdPGuXEwRfDH
         GXsd+MYOcATCNPml/8D/EfFu03Ro3yOVglshcZJvbfQJ6HvAZd+A462egVbt8VciBaDM
         JZJKvc/sxTgEJ/zcd+eJCFVzGyNRPeFGxtwisTWg2zq870Rqud6q0+NPD9UGrDYLxXIn
         gkTQ==
X-Gm-Message-State: AOAM532mZy3VdAf9UyUzLV+XKRosIzzGWvQrFt3XdP5xccUkRszx3ZCG
	JGgOO0GlPdbIzCwVGvn3/gNmSIRpseCVBA==
X-Google-Smtp-Source: ABdhPJxkdC7e6cGsGo1KcuRMbcqGJ3sfz+iaaCgQ31ugmbBPYOMI1dflpeR++lVXS3WiR7HKpV1AZw==
X-Received: by 2002:a5d:5305:: with SMTP id e5mr8654194wrv.243.1629636671991;
        Sun, 22 Aug 2021 05:51:11 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:11 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 03/55] lighttpd: convert from autotools to meson
Date: Sun, 22 Aug 2021 14:50:11 +0200
Message-Id: <20210822125103.310416-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virtual/crypt is a hard dependency in meson builds.

ipv6 support is determined automatically.

The rest of the options are converted where available;
not every autoconf option exists in meson.

Modules are now packaged in /usr/lib/lighttpd, so adjust packaging accordingly.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...n-add-with_zstd-to-meson_options.txt.patch | 27 +++++++++
 .../lighttpd/lighttpd_1.4.59.bb               | 58 +++++++++----------
 2 files changed, 56 insertions(+), 29 deletions(-)
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-meson-add-with_zstd-to-meson_options.txt.patch

diff --git a/meta/recipes-extended/lighttpd/lighttpd/0001-meson-add-with_zstd-to-meson_options.txt.patch b/meta/recipes-extended/lighttpd/lighttpd/0001-meson-add-with_zstd-to-meson_options.txt.patch
new file mode 100644
index 0000000000..ceedccbd11
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/lighttpd/0001-meson-add-with_zstd-to-meson_options.txt.patch
@@ -0,0 +1,27 @@
+From f24bd105388c305beeead5d3fa0a028b82354f18 Mon Sep 17 00:00:00 2001
+From: Glenn Strauss <gstrauss@gluelogic.com>
+Date: Wed, 3 Feb 2021 00:35:34 -0500
+Subject: [PATCH] [meson] add with_zstd to meson_options.txt
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ meson_options.txt | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/meson_options.txt b/meson_options.txt
+index 51bea44d..f6687159 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -148,6 +148,11 @@ option('with_zlib',
+ 	value: true,
+ 	description: 'with deflate-support for mod_deflate [default: on]',
+ )
++option('with_zstd',
++	type: 'boolean',
++	value: false,
++	description: 'with zstd-support for mod_deflate [default: off]',
++)
+ 
+ option('build_extra_warnings',
+ 	type: 'boolean',
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.59.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.59.bb
index f97c5913b8..f74016f834 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.59.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.59.bb
@@ -14,40 +14,38 @@ RRECOMMENDS:${PN} = "lighttpd-module-access \
                      lighttpd-module-accesslog"
 
 SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.xz \
-        file://index.html.lighttpd \
-        file://lighttpd.conf \
-        file://lighttpd \
-        file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
-        "
+           file://index.html.lighttpd \
+           file://lighttpd.conf \
+           file://lighttpd \
+           file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
+           file://0001-meson-add-with_zstd-to-meson_options.txt.patch \
+           "
 
 SRC_URI[sha256sum] = "fb953db273daef08edb6e202556cae8a3d07eed6081c96bd9903db957d1084d5"
 
+DEPENDS = "virtual/crypt"
+
 PACKAGECONFIG ??= "openssl pcre zlib \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)} \
 "
 
-PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6"
-PACKAGECONFIG[mmap] = "--enable-mmap,--disable-mmap"
-PACKAGECONFIG[libev] = "--with-libev,--without-libev,libev"
-PACKAGECONFIG[mysql] = "--with-mysql,--without-mysql,mariadb"
-PACKAGECONFIG[ldap] = "--with-ldap,--without-ldap,openldap"
-PACKAGECONFIG[attr] = "--with-attr,--without-attr,attr"
-PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind"
-PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl"
-PACKAGECONFIG[krb5] = "--with-krb5,--without-krb5,krb5"
-PACKAGECONFIG[pcre] = "--with-pcre,--without-pcre,libpcre"
-PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
-PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2"
-PACKAGECONFIG[webdav-props] = "--with-webdav-props,--without-webdav-props,libxml2 sqlite3"
-PACKAGECONFIG[webdav-locks] = "--with-webdav-locks,--without-webdav-locks,util-linux"
-PACKAGECONFIG[gdbm] = "--with-gdbm,--without-gdbm,gdbm"
-PACKAGECONFIG[memcache] = "--with-memcached,--without-memcached,libmemcached"
-PACKAGECONFIG[lua] = "--with-lua,--without-lua,lua"
-
-EXTRA_OECONF += "--enable-lfs --without-fam"
-
-inherit autotools pkgconfig update-rc.d gettext systemd
+PACKAGECONFIG[libev] = "-Dwith_libev=true,-Dwith_libev=false,libev"
+PACKAGECONFIG[mysql] = "-Dwith_mysql=true,-Dwith_mysql=false,mariadb"
+PACKAGECONFIG[ldap] = "-Dwith_ldap=true,-Dwith_ldap=false,openldap"
+PACKAGECONFIG[attr] = "-Dwith_xattr=true,-Dwith_xattr=false,attr"
+PACKAGECONFIG[openssl] = "-Dwith_openssl=true,-Dwith_openssl=false,openssl"
+PACKAGECONFIG[krb5] = "-Dwith_krb5=true,-Dwith_krb5=false,krb5"
+PACKAGECONFIG[pcre] = "-Dwith_pcre=true,-Dwith_pcre=false,libpcre"
+PACKAGECONFIG[zlib] = "-Dwith_zlib=true,-Dwith_zlib=false,zlib"
+PACKAGECONFIG[bzip2] = "-Dwith_bzip=true,-Dwith_bzip=false,bzip2"
+PACKAGECONFIG[webdav-props] = "-Dwith_webdav_props=true,-Dwith_webdav_props=false,libxml2 sqlite3"
+PACKAGECONFIG[webdav-locks] = "-Dwith_webdav_locks=true,-Dwith_webdav_locks=false,util-linux"
+PACKAGECONFIG[gdbm] = "-Dwith_gdbm=true,-Dwith_gdbm=false,gdbm"
+PACKAGECONFIG[memcache] = "-Dwith_memcached=true,-Dwith_memcached=false,libmemcached"
+PACKAGECONFIG[lua] = "-Dwith_lua=true,-Dwith_lua=false,lua"
+PACKAGECONFIG[zstd] = "-Dwith_zstd=true,-Dwith_zstd=false,zstd"
+
+inherit meson pkgconfig update-rc.d gettext systemd
 
 INITSCRIPT_NAME = "lighttpd"
 INITSCRIPT_PARAMS = "defaults 70"
@@ -71,13 +69,15 @@ do_install:append() {
 	ln -sf ${localstatedir}/tmp ${D}/www/var
 }
 
-FILES:${PN} += "${sysconfdir} /www"
+# bitbake.conf sets ${libdir}/${BPN}/* in FILES, which messes up the module split.
+# So we re-do the variable.
+FILES:${PN} = "${sysconfdir} /www ${sbindir}"
 
 CONFFILES:${PN} = "${sysconfdir}/lighttpd/lighttpd.conf"
 
 PACKAGES_DYNAMIC += "^lighttpd-module-.*"
 
 python populate_packages:prepend () {
-    lighttpd_libdir = d.expand('${libdir}')
+    lighttpd_libdir = d.expand('${prefix}/lib/lighttpd')
     do_split_packages(d, lighttpd_libdir, r'^mod_(.*)\.so$', 'lighttpd-module-%s', 'Lighttpd module for %s', extra_depends='')
 }
-- 
2.31.1

