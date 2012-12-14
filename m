Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tjf6W-0003q6-9q
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Dec 2012 00:55:47 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so2447129pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 15:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=1rY3lvA6fUq6D2WQWfy6HrIL7AnWPqLP/rwjfAcFze8=;
	b=XzFrGueFKTyJPl8C511PxuW5jdnPXEEQe1nJ2+bTA+awdwPtJy2IFUF7S6IB/ROlj/
	tWPPjlMQm5UEzEefu4/RxQmoHqrrwIuusedlvkFboMFNWbD7t4I49JzfJtwAYEqC4MjB
	TEao04cX2C1TAAB5f07KuZVE9+Yh391QjjbFH/RBF1CthO3UJDF8JzHGA92f5cqIx+Ez
	1z0IinQ4LlTvKgc7wFNoSui8VigY4a5gnfmEu8y8SWJul0GMPEFN43H4aHkjqyeTek60
	hIWVn9CkWrbfbEO7ISqYaF9K23OHDixYajiODyitO+IbJaBePNFr2OxSnBYHNaK3iK6W
	z7hg==
Received: by 10.66.77.99 with SMTP id r3mr20195260paw.10.1355528466853;
	Fri, 14 Dec 2012 15:41:06 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id sb3sm2747294pbc.44.2012.12.14.15.41.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 15:41:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Dec 2012 00:40:44 +0100
Message-Id: <85c9d0997a3446625d74b890d722f039345b6a9e.1355475937.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355475937.git.Martin.Jansa@gmail.com>
References: <cover.1355475937.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355475937.git.Martin.Jansa@gmail.com>
References: <cover.1355475937.git.Martin.Jansa@gmail.com>
Subject: [PATCH 06/10] kernel.bbclass: use the same versioning schema for modules.tgz and provide link to latest
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2012 23:55:49 -0000

* so it will work look KERNEL_IMAGE
* also we were recreating modules.tgz with every kernel build, but
  overwritting the same output file

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index ee59aaf..9c70e70 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -497,6 +497,10 @@ KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PE}-${PV}-${PR}-${MACHINE}-${DA
 # Don't include the DATETIME variable in the sstate package signatures
 KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
 KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
+MODULE_TARBALL_BASE_NAME ?= "modules-${PE}-${PV}-${PR}-${MACHINE}-${DATETIME}.tgz"
+# Don't include the DATETIME variable in the sstate package signatures
+MODULE_TARBALL_BASE_NAME[vardepsexclude] = "DATETIME"
+MODULE_TARBALL_SYMLINK_NAME ?= "modules-${MACHINE}.tgz"
 
 do_uboot_mkimage() {
 	if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then 
@@ -526,7 +530,8 @@ addtask uboot_mkimage before do_install after do_compile
 kernel_do_deploy() {
 	install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
 	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
-		tar -cvzf ${DEPLOYDIR}/modules-${KERNEL_VERSION}-${PR}-${MACHINE}.tgz -C ${D} lib
+		tar -cvzf ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME} -C ${D} lib
+		ln -sf ${MODULE_TARBALL_BASE_NAME}.bin ${MODULE_TARBALL_SYMLINK_NAME}
 	fi
 
 	cd ${DEPLOYDIR}
-- 
1.8.0.2



