Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SN82I-00078U-QH
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Apr 2012 21:37:59 +0200
Received: by vbbfr13 with SMTP id fr13so385351vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2012 12:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=9yaE9u379p7YRyG2RtsLQfoQXWxqCh5wkcJ79OhDS/0=;
	b=y+SmYfiHSm4V+Mko2h3FIezrRcINWJdZ0DFfihiztkE2NZgzm/mu48plyaysPyB9JY
	iWlPiXJrkLWJwXH+pf/+pylfFGewFhG+bhrE55yeqaXTIYNvnuivRyBHL0DW+mRpzFmA
	ghkLAtH+lzxf/0VGGbG67k6CqbcqPoWQZn6BsewnKvGdG56R4xMTZeMo0Uj0YHWyAtzq
	ZierE6R3yLf25QAFdHws0SRBu5EZ2F+IHBJe5pIzi3u3wSVrRhr8L6G0fYwVa3aGr1XN
	UQQhAy7f/ozoypC+7z0+zRMqP7S+KvsnLxS3QJQunaL1g4Jz/UNAmEM3qJ6OlhspifeI
	rslg==
Received: by 10.220.230.67 with SMTP id jl3mr3766640vcb.50.1335382102437;
	Wed, 25 Apr 2012 12:28:22 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id c17sm886075vdj.12.2012.04.25.12.28.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Apr 2012 12:28:21 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Apr 2012 16:28:08 -0300
Message-Id: <1335382089-18056-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1335382089-18056-1-git-send-email-otavio@ossystems.com.br>
References: <1335382089-18056-1-git-send-email-otavio@ossystems.com.br>
Subject: [PATCH 2/3] u-boot-mkimage: update 2012.04 to 2012.04.01 release
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
X-List-Received-Date: Wed, 25 Apr 2012 19:37:59 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../u-boot/u-boot-mkimage_2012.04.01.bb            |   33 ++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.bb  |   33 --------------------
 2 files changed, 33 insertions(+), 33 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.01.bb
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.bb

diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.01.bb
new file mode 100644
index 0000000..aa107fe
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.01.bb
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
+# This revision corresponds to the tag "v2012.04.01"
+# We use the revision in order to avoid having to fetch it from the
+# repo during parse
+SRCREV = "415d386877df49eb051b85ef74fa59a16dc17c7d"
+
+PV = "v2012.04.01+git${SRCPV}"
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
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.bb
deleted file mode 100644
index 9d59ef3..0000000
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-DESCRIPTION = "U-boot bootloader mkimage tool"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
-SECTION = "bootloader"
-
-# This is needs to be validated among supported BSP's before we can
-# make it default
-DEFAULT_PREFERENCE = "-1"
-
-# This revision corresponds to the tag "v2012.04"
-# We use the revision in order to avoid having to fetch it from the
-# repo during parse
-SRCREV = "2790bf69dc12fb9aeb9836904e5f57c7f83d5552"
-
-PV = "v2012.04+git${SRCPV}"
-
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
-
-S = "${WORKDIR}/git"
-
-EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTLD="${LD}" HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
-
-do_compile () {
-  oe_runmake tools
-}
-
-do_install () {
-  install -d ${D}${bindir}
-  install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
-  ln -sf uboot-mkimage ${D}${bindir}/mkimage
-}
-
-BBCLASSEXTEND = "native nativesdk"
-- 
1.7.2.5



