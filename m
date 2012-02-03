Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RtS8N-0002t8-9I
	for openembedded-core@lists.openembedded.org;
	Sat, 04 Feb 2012 00:01:35 +0100
Received: by pbbb4 with SMTP id b4so2932267pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2012 14:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=SFUYFKMNNhQJLNNX6WKQ9BiT5dumg48S6ukcnKDRrqo=;
	b=Y+m3bFS7uTpTcuy1mJ+g+snd4fmIStNnmKHJf441ihsniiXDsXm5u5KveL/wcPyG0r
	gUoJ1Xrf1e8KuKbDk4VyNHhdBLSoFfEQI5t1xXFEKiH9ljsjBl/mkoQ5PKudHhR+qZ88
	TOv01/+e0aPtdAFdSGF2ktKmNyxAeTKcbOuN0=
Received: by 10.68.75.233 with SMTP id f9mr13619295pbw.10.1328309616403;
	Fri, 03 Feb 2012 14:53:36 -0800 (PST)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id j4sm16151376pbg.12.2012.02.03.14.53.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 14:53:35 -0800 (PST)
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Feb 2012 15:53:30 -0700
Message-Id: <1328309610-12397-1-git-send-email-tom.rini@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Tom Rini <trini@ti.com>
Subject: [PATCH] u-boot-fw-utils: Initial version
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Feb 2012 23:01:35 -0000

From: Tom Rini <trini@ti.com>

This provides the 'fw_setenv' and 'fw_getenv' programs for the target
so that the U-Boot environment can be modified from Linux.  These
programs are system-agnostic and rely on a config file that a given BSP
will provide (and RRECOMMEND this be installed).

Signed-off-by: Tom Rini <trini@ti.com>
---
 meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb |   26 ++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb

diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
new file mode 100644
index 0000000..3185cbd
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "U-boot bootloader fw_printenv/setenv utils"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
+                    file://README;beginline=1;endline=22;md5=5ba4218ac89af7846802d0348df3fb90"
+SECTION = "bootloader"
+
+PR = "r0"
+
+SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "0cc5026aad02f218a9b9ac56b301c97a"
+SRC_URI[sha256sum] = "362ddb935885da98cf461eba08f31e3e59d0c4ada6cb2fa15596f43af310ba8b"
+
+S = "${WORKDIR}/u-boot-${PV}"
+
+EXTRA_OEMAKE = 'HOSTCC="${CC}"'
+
+do_compile () {
+  oe_runmake env
+}
+
+do_install () {
+  install -d ${D}${base_sbindir}
+  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
+  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
+}
-- 
1.7.0.4



