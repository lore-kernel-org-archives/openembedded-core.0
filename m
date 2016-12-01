Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6E7936078E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 02:33:25 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id DE60EB81C73; Thu,  1 Dec 2016 03:33:23 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2016 03:33:23 +0100
Message-Id: <1480559603-28235-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480542437-22778-1-git-send-email-obi@opendreambox.org>
References: <1480542437-22778-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH v2] lighttpd: Add many packageconfig options
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
X-List-Received-Date: Thu, 01 Dec 2016 02:33:28 -0000

Respect largefile and xattr distro features.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
v2: In 1.4.42, upstream renamed --with-kerberos5 to --with-krb5
    and introduced mod_authn_gssapi with a new dependency on krb5.

 meta/recipes-extended/lighttpd/lighttpd_1.4.43.bb | 37 ++++++++++++++---------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.43.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.43.bb
index 322f212..38eaf70 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.43.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.43.bb
@@ -6,7 +6,6 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e4dac5c6ab169aa212feb5028853a579"
 
 SECTION = "net"
-DEPENDS = "zlib libpcre"
 RDEPENDS_${PN} += " \
                lighttpd-module-access \
                lighttpd-module-accesslog \
@@ -26,22 +25,30 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
 SRC_URI[md5sum] = "95eda531c27b161ef8fa2b9bf4948caf"
 SRC_URI[sha256sum] = "fe0c4a06dd2408a83ee7a2bfedc45e09597f3313cbda82485507573ae8fa948a"
 
-PACKAGECONFIG ??= "openssl \
+PACKAGECONFIG ??= "openssl pcre zlib \
     ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'lfs', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)} \
 "
-PACKAGECONFIG[openssl] = "--with-openssl, --without-openssl, openssl"
-PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-
-EXTRA_OECONF = " \
-             --without-bzip2 \
-             --without-ldap \
-             --without-lua \
-             --without-memcached \
-             --with-pcre \
-             --without-webdav-props \
-             --without-webdav-locks \
-             --disable-static \
-"
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
 
 inherit autotools pkgconfig update-rc.d gettext systemd
 
-- 
2.7.4


