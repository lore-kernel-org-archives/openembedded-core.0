Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CE2196148C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 13:00:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9VD0PwO024398
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 31 Oct 2013 06:00:25 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 31 Oct 2013 06:00:24 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Oct 2013 21:00:16 +0800
Message-ID: <e1ea5d19b671e6e7bd75d7fa26caefa217566061.1383223789.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1383223789.git.hongxu.jia@windriver.com>
References: <cover.1383223789.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/1] qemu: add PACKAGECONFIG for vnc, libcurl, nss, uuid, curses, gtk+, libcap-ng
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
X-List-Received-Date: Thu, 31 Oct 2013 13:00:24 -0000
Content-Type: text/plain

Use PACKAGECONFIG to explicitly address vnc, libcurl, nss, uuid, curses, gtk+,
libcap-ng dependencies rather than tested by configure.

It avoided potential errors while multiple builds shared a common state_cache.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 1b861d7..e88c423 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -28,10 +28,9 @@ SRC_URI_append_class-native = "\
     file://fix-libcap-header-issue-on-some-distro.patch \
     "
 
-EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls --audio-drv-list=oss,alsa --disable-curl --disable-vnc-jpeg --disable-bluez --with-system-pixman --extra-cflags='${CFLAGS}'"
+EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --audio-drv-list=oss,alsa --disable-bluez --with-system-pixman --extra-cflags='${CFLAGS}'"
 
-EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls \
-				--disable-curl \
+EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror \
 				"
 export LIBTOOL="${HOST_SYS}-libtool"
 
@@ -83,6 +82,17 @@ do_install_append() {
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr,--disable-virtfs,libcap attr,"
 PACKAGECONFIG[aio] = "--enable-linux-aio,--disable-linux-aio,libaio,"
+PACKAGECONFIG[vnc-tls] = "--enable-vnc --enable-vnc-tls,--disable-vnc-tls, gnutls,"
+PACKAGECONFIG[vnc-ws] = "--enable-vnc --enable-vnc-ws,--disable-vnc-ws, gnutls,"
+PACKAGECONFIG[vnc-sasl] = "--enable-vnc --enable-vnc-sasl,--disable-vnc-sasl,cyrus-sasl,"
+PACKAGECONFIG[vnc-jpeg] = "--enable-vnc --enable-vnc-jpeg,--disable-vnc-jpeg,jpeg,"
+PACKAGECONFIG[vnc-png] = "--enable-vnc --enable-vnc-png,--disable-vnc-png,libpng,"
+PACKAGECONFIG[libcurl] = "--enable-curl,--disable-curl,libcurl,"
+PACKAGECONFIG[nss] = "--enable-smartcard-nss,--disable-smartcard-nss,nss,"
+PACKAGECONFIG[uuid] = "--enable-uuid,--disable-uuid,util-linux,"
+PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,"
+PACKAGECONFIG[gtk+] = "--enable-gtk,--disable-gtk,gtk+ libvte,"
+PACKAGECONFIG[libcap-ng] = "--enable-cap-ng,--disable-cap-ng,libcap-ng,"
 
 # Qemu target will not build in world build for ARM or Mips
 BROKEN_qemuarm = "1"
-- 
1.8.1.2


