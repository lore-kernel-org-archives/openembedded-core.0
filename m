Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 74586780A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 08:57:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v4J8vHUp010099
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 19 May 2017 01:57:17 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Fri, 19 May 2017 01:57:16 -0700
From: <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Fri, 19 May 2017 16:52:46 +0800
Message-ID: <d0db7f059097d0271e5808dda280140ef49aae6f.1495183828.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1495183828.git.kai.kang@windriver.com>
References: <cover.1495183828.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] bind: build with threads and update configure options
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
X-List-Received-Date: Fri, 19 May 2017 08:57:16 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Build without threads for bind is inherited from legacy openembedded.
All libc's support proper threading on Linux now, so enable threads
support for bind.

It is also need to disable static library build which cause package dhcp
fail to build after enable bind threads support.

Options devpoll and epoll are configured to choose most preferable
multiplex method for unix socket. The priorities are: epoll > poll >
select. When set '--enable-epoll', it just defines a var and include
header file that is available for cross compile. So use epoll for bind.

Add PACKAGECONFIG 'urandom' that could use /dev/urandom as random device.

Update file/directory ownerships to fix daemon start failure.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-connectivity/bind/bind/generate-rndc-key.sh |  1 +
 meta/recipes-connectivity/bind/bind_9.10.3-P3.bb         | 10 ++++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/bind/bind/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind/generate-rndc-key.sh
index db20127..ef915c0 100644
--- a/meta/recipes-connectivity/bind/bind/generate-rndc-key.sh
+++ b/meta/recipes-connectivity/bind/bind/generate-rndc-key.sh
@@ -3,5 +3,6 @@
 if [ ! -s /etc/bind/rndc.key ]; then
     echo -n "Generating /etc/bind/rndc.key:"
     /usr/sbin/rndc-confgen -a -b 512 -r /dev/urandom
+    chown root:bind /etc/bind/rndc.key
     chmod 0640 /etc/bind/rndc.key
 fi
diff --git a/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb b/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
index 18249f2..7eb79b0 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
@@ -38,8 +38,8 @@ SRC_URI[md5sum] = "bcf7e772b616f7259420a3edc5df350a"
 SRC_URI[sha256sum] = "690810d1fbb72afa629e74638d19cd44e28d2b2e5eb63f55c705ad85d1a4cb83"
 
 ENABLE_IPV6 = "--enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)}"
-EXTRA_OECONF = " ${ENABLE_IPV6} --with-randomdev=/dev/random --disable-threads \
-                 --disable-devpoll --disable-epoll --with-gost=no \
+EXTRA_OECONF = " ${ENABLE_IPV6} --with-libtool --enable-threads \
+                 --disable-devpoll --enable-epoll --with-gost=no \
                  --with-gssapi=no --with-ecdsa=yes \
                  --sysconfdir=${sysconfdir}/bind \
                  --with-openssl=${STAGING_LIBDIR}/.. \
@@ -51,6 +51,7 @@ PACKAGECONFIG ?= "readline"
 PACKAGECONFIG[httpstats] = "--with-libxml2,--without-libxml2,libxml2"
 PACKAGECONFIG[readline] = "--with-readline=-lreadline,,readline"
 PACKAGECONFIG[libedit] = "--with-readline=-ledit,,libedit"
+PACKAGECONFIG[urandom] = "--with-randomdev=/dev/urandom,--with-randomdev=/dev/random,,"
 
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system --home ${localstatedir}/cache/bind --no-create-home \
@@ -101,6 +102,11 @@ do_install_append() {
 
 	install -d ${D}${sysconfdir}/default
 	install -m 0644 ${WORKDIR}/bind9 ${D}${sysconfdir}/default
+
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+		install -d ${D}${sysconfdir}/tmpfiles.d
+		echo "d /run/named 0755 bind bind - -" > ${D}${sysconfdir}/tmpfiles.d/bind.conf
+	fi
 }
 
 CONFFILES_${PN} = " \
-- 
2.10.1


