Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TcyA0-0004JX-GY
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Nov 2012 13:51:40 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so6053661eei.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2012 04:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=F3xQBUB03pQOtEPQLEVj+hguNLSbVU0h8gPaWLQG9ww=;
	b=qpQ/kH8nz4watkKXO4Bs/oOmaPbSlZEWgrnHc7wyt9ngo72b0qpbx8Gi2erC9zBEsM
	FrNupdwUI/FAsXAfsK7L6CV0ePqAmePpUdQfwvvk7zp+bDi1w/6QZ/3j4pVvEx1ZdxPs
	3C0pB6c2aJ39GykJJ+RPrPRSci2QtD3/SXBlx+HbgOrEQPpKOpn4K/4sKDvzn35X4pkc
	0wyG/zKXU2OxbnY8zwvOn3+mj1H8UvKzjGMojJA0KAG5h2jVptBsHXdOWmgcA+TfzVLx
	H8qo+j5rhDOqxYk93fRqvQIh5rUoIYZcFrruE7+R+9GN9u8OT0Kww9L5jY2+dzt6seza
	avCg==
Received: by 10.14.193.136 with SMTP id k8mr45109670een.30.1353933448924;
	Mon, 26 Nov 2012 04:37:28 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a45sm33353090eep.16.2012.11.26.04.37.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Nov 2012 04:37:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Nov 2012 13:37:32 +0100
Message-Id: <1353933452-13251-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1348318001-18232-1-git-send-email-Martin.Jansa@gmail.com>
References: <1348318001-18232-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH] kernel.bbclass: use the same versioning schema for modules.tgz and provide link to latest
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
X-List-Received-Date: Mon, 26 Nov 2012 12:51:40 -0000

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
1.8.0



