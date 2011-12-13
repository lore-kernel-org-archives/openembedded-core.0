Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1RaVDC-0000sV-Dg
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 17:28:14 +0100
Received: by mail-ww0-f43.google.com with SMTP id ds11so12054547wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 08:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=rc5r+I1vDA4XmSNHBDld9GvEpGVDy2UyakSaMZCzt/0=;
	b=n8JaeXKy8kMjqhl0F+yhNqjXdUlKpNwRVP3GNmSCC4zqfNBa++Sna7AV/ffU1Fakam
	zaJ6qcdwiaktsdE+MPeBve3XT0sdgb7h1O4avWxdgCzBx9Tgn0lb6VJgE4mUmDamxAVk
	z4tKz76mhA2xcLmHgeoNrRYjKRN6sbQgHs84s=
Received: by 10.227.60.14 with SMTP id n14mr17187452wbh.5.1323793280170;
	Tue, 13 Dec 2011 08:21:20 -0800 (PST)
Received: from fangorn.rup.mentorg.com (nat-rup.mentorg.com. [139.181.168.34])
	by mx.google.com with ESMTPS id 28sm27231923wby.3.2011.12.13.08.21.18
	(version=SSLv3 cipher=OTHER); Tue, 13 Dec 2011 08:21:19 -0800 (PST)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2011 20:19:47 +0400
Message-Id: <1323793193-31090-3-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
References: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
Subject: [PATCH 3/9] bitbake.conf, core-image-minimal-initramfs: add INITRAMFS_FSTYPES
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
X-List-Received-Date: Tue, 13 Dec 2011 16:28:14 -0000

Initramfs images don't benefit from usual IMAGE_FSTYPES overrides. The
only sane values for them are "cpio.XXX". If IMAGE_FSTYPES is set to
include 'live', building core-image-minimal-initramfs can result in
build error, if the image is built before the kernel. To stop initramfs
images from responding on IMAGE_FSTYPES settings, but still allow
users/developers to override defaults (e.g. to generate "cpio.lzma"
initramfs), introduce INITRAMFS_FSTYPES variable, by default set to
"cpio.gz".

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/conf/bitbake.conf                             |    1 +
 .../images/core-image-minimal-initramfs.bb         |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f79e3f7..1c21616 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -673,6 +673,7 @@ require conf/abi_version.conf
 DL_DIR ?= "${TOPDIR}/downloads"
 SSTATE_DIR ?= "${TOPDIR}/sstate-cache"
 IMAGE_FSTYPES ?= "tar.gz"
+INITRAMFS_FSTYPES ?= "cpio.gz"
 PCMCIA_MANAGER ?= "pcmcia-cs"
 DEFAULT_TASK_PROVIDER ?= "task-base"
 MACHINE_TASK_PROVIDER ?= "${DEFAULT_TASK_PROVIDER}"
diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
index d078c10..5149f31 100644
--- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
+++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
@@ -10,7 +10,7 @@ IMAGE_LINGUAS = ""
 
 LICENSE = "MIT"
 
+IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
 inherit core-image
 
 IMAGE_ROOTFS_SIZE = "8192"
-IMAGE_FSTYPES =+ "cpio.gz"
-- 
1.7.7.3



