Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7EB9A78A10
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 22:07:48 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id h40-v6so5846442wrh.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2018 15:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mTeoLX5SWe+KTyh1jRQ6gXQiBnKm+o9EBSZEc6X2kNU=;
	b=k2xWoLt108Yt2/tZopH8YEDuCtHB05ZTAK0Qnh87kaR9xxkP4jPqD/YU881/rGZYHU
	SekbC6moUjC7QxrXGzaC7FmyWVKQ0aLyZ9TSoOWbZOTd29f+AdHvEDqgYjKG6CVsM4cu
	Yj9lCwGB0dOq0kOeLK7Q1yz6zkgzYgk3vchZIlmuusdki13wX8kzd8akrlaSpsq8BNA+
	uKhpwge6G9VQ04EqMjD2qrZWVfZJ2+oQbdRp5vVwrxQdaAX07TmyFCOmZ7KGi4Fg3oPc
	5fNz2QCyqHHw8VNTGettUJXwZSZpECUuSY0FNjkegPQ1PJR0gb8CaGfqlzLRs8ruSseE
	zhcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mTeoLX5SWe+KTyh1jRQ6gXQiBnKm+o9EBSZEc6X2kNU=;
	b=BDh9I/DNZhXUDB6lYJrl3PdNHBGgVgKcGSuYm/wiwkvw2k31WYCyfepWF3j9Pxlos4
	w+VrAjCMsAr0ki7D+nW9wxUPE7d3vb78hY5JcjNChr/MHjxGgo8/LdGByoxx6exNHYKl
	+9MoKtJQ5NK+YPyLg7UPyHiJo5C8oqb45ETbJR/YQgyFH+JwNCv7HA9u810NY0YrUzAH
	URON1o/gV/gtASkJvfqyi9HU6dyuAlPLRdmtfl//pdclSvPp/5oPIKn2GySk88Cbr0sK
	5+W/oE3Ouprj7lq8eGWDv30JN12WKZp77S28XamA28D5gwEBbGzpOWG1NS0YisryNi+L
	lwDg==
X-Gm-Message-State: APt69E0uXUf60B9anEjh1ZurgZlSQQhE9ZL7B3gPlaoDZKUyco58aRE4
	IHquZODAqNGueQ+2XUpRAVuPgA==
X-Google-Smtp-Source: AAOMgpcW3tTnbaks0aWWVU4i0Ct2kgJiMH15sxiVshlkaOvIupJeGCdq7sE/jWMNG2a3PbrT9ILKlQ==
X-Received: by 2002:a5d:45c1:: with SMTP id
	b1-v6mr17489271wrs.106.1530569269099; 
	Mon, 02 Jul 2018 15:07:49 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	p187-v6sm16271781wmd.42.2018.07.02.15.07.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 02 Jul 2018 15:07:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jul 2018 22:07:44 +0000
Message-Id: <20180702220744.10881-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180702220744.10881-1-Martin.Jansa@gmail.com>
References: <CA+chaQd9otpzozM5DrifBUVdODogBsVdy2U8czAAd+Ys_6TBtA@mail.gmail.com>
	<20180702220744.10881-1-Martin.Jansa@gmail.com>
Subject: [PATCHv2 4/4] kernel.bbclass: move variables for kernel artifacts names to separate bbclass
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
X-List-Received-Date: Mon, 02 Jul 2018 22:07:48 -0000

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
index 0000000000..d696888322
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
index 0045cec819..42efa382ad 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -657,23 +657,7 @@ do_sizecheck[dirs] = "${B}"
 
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
 	deployDir="${DEPLOYDIR}"
-- 
2.17.1


