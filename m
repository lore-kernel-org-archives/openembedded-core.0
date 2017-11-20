Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 120057869F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 20:11:26 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 9so21149216wme.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 12:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LV0E2aYjmj5+6HUaEpNVIKPHk1CwPnZU54pupsf7IBU=;
	b=YlJ2yGtM6obiH9VgJoXEG2imBefJDpZYvAMEqtd2QfQ/FoNvxbsXVq5yi96vyf6H0G
	Zb2IXqU/MjJ2To/HeIK2O4cfoPo4CwoYXiuW/Mit/mHFwpFMPD6YyNZeT1WJnT+FcZsF
	AKnqS9r4gOGDdPVzPVGF3WBuHN0vhwpUUlL5WfokcyftLr7za61rXiA2JfGfKfWKKyGe
	loi3CRRv3ZjmuMvQHsSWtEiGJ2s5Ms5GnfgYze2NCmRDE6FKY0uUfJ66EJzxI/oq3OGX
	oCAgo/0D1Y/m1BcAz9pJ5DnKWLoFc/F93jQ/eTBAk3aEqH4gS1YyOQ98NAaU+XdMsxzT
	naxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LV0E2aYjmj5+6HUaEpNVIKPHk1CwPnZU54pupsf7IBU=;
	b=Hx9CEaf7fyZfGPT7d64O2gHLANM7i4CyW66JwheDpsliwWy6ccibVAnkD/LK6Y7TED
	kwSvGOvoqEWSSg7+yJOI/ulPhTz7lIq2EiXtMC51YflRIBJ9noxTuTtAQjgph2UPvGuv
	3YReewPnjw9cZjSlqntrlrb5kYO0IWrm0wHkWIbulA6xEOSRcty3FSkSXsWikGjFrrXN
	sRlqiJ84z002UfsBgU7ek/v2VcPxnu7KKEFHHnTyUEisf29zhBmgRAvoTK6Ajf+Ftd54
	NtBKykntXHNoKXtogwHZCxAv47rtWgpdaPa8EjbC2MCR6F9cX9KrRW+/Jb/i/VyrnSII
	UkvA==
X-Gm-Message-State: AJaThX4LmT6Oef2aSxcB7f0H246NdsSEo+d4oCuiDpfbzjbS8SfeVfzt
	BSkNcTuCncCVgcjH0v1UVad/Sg==
X-Google-Smtp-Source: AGs4zMYy2g14/nuDejLje3vEAlO/7uTCyo39MSv35XGhE57DSjGlc7B1ZiKc64YncLzvC0IeMej7Sg==
X-Received: by 10.28.159.15 with SMTP id i15mr10714146wme.58.1511208687838;
	Mon, 20 Nov 2017 12:11:27 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	f10sm11046326wrg.20.2017.11.20.12.11.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Nov 2017 12:11:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Nov 2017 20:11:04 +0000
Message-Id: <473468c6099e62fc71b294de1689ad8a0cddb1f1.1511207344.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1511207344.git.Martin.Jansa@gmail.com>
References: <cover.1511207344.git.Martin.Jansa@gmail.com>
Subject: [RFC][PATCH 5/5] kernel.bbclass: move variables for kernel artifacts names to separate bbclass
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
X-List-Received-Date: Mon, 20 Nov 2017 20:11:27 -0000

* this makes it easier to access these variables from some other bbclass
  e.g. sdcard_image-rpi.bbclass in meta-raspberry where we need to know
  how some files in deploy are named, but we cannot inherit kernel.bbclass
  as it's used in image recipe not kernel recipe
* alternatively we can move these to bitbake.conf like similar image variables are:
  meta/conf/bitbake.conf:IMAGE_BASENAME = "${PN}"
  meta/conf/bitbake.conf:IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}-${DATETIME}"
  meta/conf/bitbake.conf:IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel-artifact-names.bbclass | 19 +++++++++++++++++++
 meta/classes/kernel.bbclass                | 18 +-----------------
 2 files changed, 20 insertions(+), 17 deletions(-)
 create mode 100644 meta/classes/kernel-artifact-names.bbclass

diff --git a/meta/classes/kernel-artifact-names.bbclass b/meta/classes/kernel-artifact-names.bbclass
new file mode 100644
index 0000000..d696888
--- /dev/null
+++ b/meta/classes/kernel-artifact-names.bbclass
@@ -0,0 +1,19 @@
+KERNEL_IMAGE_BASE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
+# Don't include the DATETIME variable in the sstate package signatures
+KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
+KERNEL_IMAGE_SYMLINK_NAME ?= "${MACHINE}"
+
+KERNEL_DTB_BASE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
+KERNEL_DTB_BASE_NAME[vardepsexclude] = "DATETIME"
+KERNEL_DTB_SYMLINK_NAME ?= "${MACHINE}"
+
+MODULE_IMAGE_BASE_NAME ?= "modules-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
+MODULE_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
+
+MODULE_TARBALL_BASE_NAME ?= "${MODULE_IMAGE_BASE_NAME}.tgz"
+MODULE_TARBALL_SYMLINK_NAME ?= "modules-${MACHINE}.tgz"
+MODULE_TARBALL_DEPLOY ?= "1"
+
+INITRAMFS_BASE_NAME ?= "initramfs-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
+INITRAMFS_BASE_NAME[vardepsexclude] = "DATETIME"
+INITRAMFS_SYMLINK_NAME ?= "initramfs-${MACHINE}"
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 9ec7dd2..455f939 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -612,23 +612,7 @@ do_sizecheck[dirs] = "${B}"
 
 addtask sizecheck before do_install after do_strip
 
-KERNEL_IMAGE_BASE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
-# Don't include the DATETIME variable in the sstate package signatures
-KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
-KERNEL_IMAGE_SYMLINK_NAME ?= "${MACHINE}"
-KERNEL_DTB_BASE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
-KERNEL_DTB_BASE_NAME[vardepsexclude] = "DATETIME"
-KERNEL_DTB_SYMLINK_NAME ?= "${MACHINE}"
-MODULE_IMAGE_BASE_NAME ?= "modules-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
-MODULE_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
-MODULE_TARBALL_BASE_NAME ?= "${MODULE_IMAGE_BASE_NAME}.tgz"
-# Don't include the DATETIME variable in the sstate package signatures
-MODULE_TARBALL_SYMLINK_NAME ?= "modules-${MACHINE}.tgz"
-MODULE_TARBALL_DEPLOY ?= "1"
-
-INITRAMFS_BASE_NAME ?= "initramfs-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
-INITRAMFS_BASE_NAME[vardepsexclude] = "DATETIME"
-INITRAMFS_SYMLINK_NAME ?= "initramfs-${MACHINE}"
+inherit kernel-artifact-names
 
 kernel_do_deploy() {
 	for type in ${KERNEL_IMAGETYPES} ; do
-- 
2.7.4


