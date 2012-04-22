Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SM2PF-0006Dw-9i
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Apr 2012 21:25:09 +0200
Received: by mail-vb0-f47.google.com with SMTP id fr13so8416520vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Apr 2012 12:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=DnigMux/IPiIiQVAWd+pL4bM7B46vXMgghJ8huW5u38=;
	b=ZbTzWnsTmdM6rSqh8Nb+dtL/qhquShyPBCDRfyRzYhHjVZMD6CRwNq2djELKlRXsEr
	rLmFpmTnGZMFq/bScbRUOWaQXYEop/tBX3+Fa/b/ql611PD+fbtiqYByVLE2NvpS1/+l
	CjuVSYN/H4TAtQN8FpySSTjiLdLOwPFq4XEU/70fiKUxJGAZDX89vUgtxgs2Rz7gB6DL
	HLqqkdY0jPiwScSz+st90uE33wDkpOhB520Xv0dQRz3jDVkEtIgkgDEDYaDoZc7Ryjre
	f3Y6RH2yqrlOeHDMqh+CSFHkL77xQaPOk4sv7e/xF/WMK6IZ1MGc/Yq500D64XwuVeqC
	ltqg==
Received: by 10.52.70.209 with SMTP id o17mr4505576vdu.11.1335122138935;
	Sun, 22 Apr 2012 12:15:38 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id fd3sm21452715vdc.22.2012.04.22.12.15.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 22 Apr 2012 12:15:38 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Sun, 22 Apr 2012 16:15:25 -0300
Message-Id: <6b5dc7c45d19b008686b629868ae466102fe433d.1335118370.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1335118369.git.otavio@ossystems.com.br>
References: <cover.1335118369.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1335118369.git.otavio@ossystems.com.br>
References: <cover.1335118369.git.otavio@ossystems.com.br>
Subject: [PATCH 4/5] u-boot-mkimage: add 2012.04 release
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
X-List-Received-Date: Sun, 22 Apr 2012 19:25:09 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.bb |   33 +++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.bb

diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.bb
new file mode 100644
index 0000000..9d59ef3
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "U-boot bootloader mkimage tool"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
+SECTION = "bootloader"
+
+# This is needs to be validated among supported BSP's before we can
+# make it default
+DEFAULT_PREFERENCE = "-1"
+
+# This revision corresponds to the tag "v2012.04"
+# We use the revision in order to avoid having to fetch it from the
+# repo during parse
+SRCREV = "2790bf69dc12fb9aeb9836904e5f57c7f83d5552"
+
+PV = "v2012.04+git${SRCPV}"
+
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTLD="${LD}" HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
+
+do_compile () {
+  oe_runmake tools
+}
+
+do_install () {
+  install -d ${D}${bindir}
+  install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
+  ln -sf uboot-mkimage ${D}${bindir}/mkimage
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.2.5



