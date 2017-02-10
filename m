Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 8C19B60720
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 12:42:34 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v1ACgYJU021618
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 13:42:34 +0100
Received: from dev.sbt.siemens.com ([163.242.52.173])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id v1ACgXsP026438;
	Fri, 10 Feb 2017 13:42:33 +0100
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id 6CBC3842D7;
	Fri, 10 Feb 2017 13:42:33 +0100 (CET)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 13:42:29 +0100
Message-Id: <1486730549-17608-1-git-send-email-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] lighttpd: Upgrade 1.4.43 -> 1.4.45
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Feb 2017 12:42:36 -0000

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta/recipes-extended/lighttpd/lighttpd_1.4.43.bb | 84 -----------------------
 meta/recipes-extended/lighttpd/lighttpd_1.4.45.bb | 84 +++++++++++++++++++++++
 2 files changed, 84 insertions(+), 84 deletions(-)
 delete mode 100644 meta/recipes-extended/lighttpd/lighttpd_1.4.43.bb
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd_1.4.45.bb

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.43.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.43.bb
deleted file mode 100644
index f70f9b7..0000000
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.43.bb
+++ /dev/null
@@ -1,84 +0,0 @@
-SUMMARY = "Lightweight high-performance web server"
-HOMEPAGE = "http://www.lighttpd.net/"
-BUGTRACKER = "http://redmine.lighttpd.net/projects/lighttpd/issues"
-
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e4dac5c6ab169aa212feb5028853a579"
-
-SECTION = "net"
-RDEPENDS_${PN} = "lighttpd-module-dirlisting \
-                  lighttpd-module-indexfile \
-                  lighttpd-module-staticfile"
-RRECOMMENDS_${PN} = "lighttpd-module-access \
-                     lighttpd-module-accesslog"
-
-SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.xz \
-        file://index.html.lighttpd \
-        file://lighttpd.conf \
-        file://lighttpd \
-        file://lighttpd.service \
-        file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
-        "
-
-SRC_URI[md5sum] = "95eda531c27b161ef8fa2b9bf4948caf"
-SRC_URI[sha256sum] = "fe0c4a06dd2408a83ee7a2bfedc45e09597f3313cbda82485507573ae8fa948a"
-
-PACKAGECONFIG ??= "openssl pcre zlib \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'lfs', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)} \
-"
-PACKAGECONFIG[lfs] = "--enable-lfs,--disable-lfs"
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
-PACKAGECONFIG[fam] = "--with-fam,--without-fam,gamin"
-PACKAGECONFIG[webdav-props] = "--with-webdav-props,--without-webdav-props,libxml2 sqlite3"
-PACKAGECONFIG[webdav-locks] = "--with-webdav-locks,--without-webdav-locks,util-linux"
-PACKAGECONFIG[gdbm] = "--with-gdbm,--without-gdbm,gdbm"
-PACKAGECONFIG[memcache] = "--with-memcached,--without-memcached,libmemcached"
-PACKAGECONFIG[lua] = "--with-lua,--without-lua,lua5.1"
-
-inherit autotools pkgconfig update-rc.d gettext systemd
-
-INITSCRIPT_NAME = "lighttpd"
-INITSCRIPT_PARAMS = "defaults 70"
-
-SYSTEMD_SERVICE_${PN} = "lighttpd.service"
-
-do_install_append() {
-	install -d ${D}${sysconfdir}/init.d ${D}${sysconfdir}/lighttpd.d ${D}/www/pages/dav
-	install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d
-	install -m 0644 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}
-	install -m 0644 ${WORKDIR}/index.html.lighttpd ${D}/www/pages/index.html
-
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/lighttpd.service ${D}${systemd_unitdir}/system
-	sed -i -e 's,@SBINDIR@,${sbindir},g' \
-		-e 's,@SYSCONFDIR@,${sysconfdir},g' \
-		-e 's,@BASE_BINDIR@,${base_bindir},g' \
-		${D}${systemd_unitdir}/system/lighttpd.service
-	#For FHS compliance, create symbolic links to /var/log and /var/tmp for logs and temporary data
-	ln -sf ${localstatedir}/log ${D}/www/logs
-	ln -sf ${localstatedir}/tmp ${D}/www/var
-}
-
-FILES_${PN} += "${sysconfdir} /www"
-
-CONFFILES_${PN} = "${sysconfdir}/lighttpd.conf"
-
-PACKAGES_DYNAMIC += "^lighttpd-module-.*"
-
-python populate_packages_prepend () {
-    lighttpd_libdir = d.expand('${libdir}')
-    do_split_packages(d, lighttpd_libdir, '^mod_(.*)\.so$', 'lighttpd-module-%s', 'Lighttpd module for %s', extra_depends='')
-}
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.45.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.45.bb
new file mode 100644
index 0000000..c82d93b
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.45.bb
@@ -0,0 +1,84 @@
+SUMMARY = "Lightweight high-performance web server"
+HOMEPAGE = "http://www.lighttpd.net/"
+BUGTRACKER = "http://redmine.lighttpd.net/projects/lighttpd/issues"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e4dac5c6ab169aa212feb5028853a579"
+
+SECTION = "net"
+RDEPENDS_${PN} = "lighttpd-module-dirlisting \
+                  lighttpd-module-indexfile \
+                  lighttpd-module-staticfile"
+RRECOMMENDS_${PN} = "lighttpd-module-access \
+                     lighttpd-module-accesslog"
+
+SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.xz \
+        file://index.html.lighttpd \
+        file://lighttpd.conf \
+        file://lighttpd \
+        file://lighttpd.service \
+        file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
+        "
+
+SRC_URI[md5sum] = "a128e1eda76899ce3fd115efae5fe631"
+SRC_URI[sha256sum] = "1c97225deea33eefba6d4158c2cef27913d47553263516bbe9d2e2760fc43a3f"
+
+PACKAGECONFIG ??= "openssl pcre zlib \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'lfs', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)} \
+"
+PACKAGECONFIG[lfs] = "--enable-lfs,--disable-lfs"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6"
+PACKAGECONFIG[mmap] = "--enable-mmap,--disable-mmap"
+PACKAGECONFIG[libev] = "--with-libev,--without-libev,libev"
+PACKAGECONFIG[mysql] = "--with-mysql,--without-mysql,mariadb"
+PACKAGECONFIG[ldap] = "--with-ldap,--without-ldap,openldap"
+PACKAGECONFIG[attr] = "--with-attr,--without-attr,attr"
+PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind"
+PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl"
+PACKAGECONFIG[krb5] = "--with-krb5,--without-krb5,krb5"
+PACKAGECONFIG[pcre] = "--with-pcre,--without-pcre,libpcre"
+PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
+PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2"
+PACKAGECONFIG[fam] = "--with-fam,--without-fam,gamin"
+PACKAGECONFIG[webdav-props] = "--with-webdav-props,--without-webdav-props,libxml2 sqlite3"
+PACKAGECONFIG[webdav-locks] = "--with-webdav-locks,--without-webdav-locks,util-linux"
+PACKAGECONFIG[gdbm] = "--with-gdbm,--without-gdbm,gdbm"
+PACKAGECONFIG[memcache] = "--with-memcached,--without-memcached,libmemcached"
+PACKAGECONFIG[lua] = "--with-lua,--without-lua,lua5.1"
+
+inherit autotools pkgconfig update-rc.d gettext systemd
+
+INITSCRIPT_NAME = "lighttpd"
+INITSCRIPT_PARAMS = "defaults 70"
+
+SYSTEMD_SERVICE_${PN} = "lighttpd.service"
+
+do_install_append() {
+	install -d ${D}${sysconfdir}/init.d ${D}${sysconfdir}/lighttpd.d ${D}/www/pages/dav
+	install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d
+	install -m 0644 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}
+	install -m 0644 ${WORKDIR}/index.html.lighttpd ${D}/www/pages/index.html
+
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/lighttpd.service ${D}${systemd_unitdir}/system
+	sed -i -e 's,@SBINDIR@,${sbindir},g' \
+		-e 's,@SYSCONFDIR@,${sysconfdir},g' \
+		-e 's,@BASE_BINDIR@,${base_bindir},g' \
+		${D}${systemd_unitdir}/system/lighttpd.service
+	#For FHS compliance, create symbolic links to /var/log and /var/tmp for logs and temporary data
+	ln -sf ${localstatedir}/log ${D}/www/logs
+	ln -sf ${localstatedir}/tmp ${D}/www/var
+}
+
+FILES_${PN} += "${sysconfdir} /www"
+
+CONFFILES_${PN} = "${sysconfdir}/lighttpd.conf"
+
+PACKAGES_DYNAMIC += "^lighttpd-module-.*"
+
+python populate_packages_prepend () {
+    lighttpd_libdir = d.expand('${libdir}')
+    do_split_packages(d, lighttpd_libdir, '^mod_(.*)\.so$', 'lighttpd-module-%s', 'Lighttpd module for %s', extra_depends='')
+}
-- 
2.1.4


