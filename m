Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TdJwN-0006S8-0k
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 13:07:03 +0100
Received: by mail-gh0-f175.google.com with SMTP id z2so1317872ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2012 03:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=YLBH2BMwzJbAiayqNQyz4H33yxRb5V58OPjP3JFgR8w=;
	b=XbvtXKU34xrECdr5w+NBx4ElzYGALLXFNTCPinkA+5hvzQ92JLt1u16BGtEw0LhMiW
	KQhw40gACWy+T5l/NZBAmsUyMnMTWZKWqvvTcOmWUe9dJmSRlAfzhcKGrR/9QxIcBIYu
	PajIT35xvMvJHt9jk2p33IuSU4IlDAu/VMlXaUmGI0t3htc1ets6wprx7VfWFJOhnPea
	dkSlV4vq/57BsJcC9fpE5CwPkLiphXjBCvn7uZ5VrHI826wOR+FBbN9cWzbzOBZoUL4/
	t/8EgXPTBfRMj6CcNbi12IXmIpaEpt40JmSrl8gZeQoiki3TI1G6gvvCLnA4LCv6Rf0n
	1Aug==
Received: by 10.101.10.35 with SMTP id n35mr4228565ani.20.1354017169657;
	Tue, 27 Nov 2012 03:52:49 -0800 (PST)
Received: from nano.lab.ossystems.com.br.lab.ossystems.com.br
	([177.100.163.15])
	by mx.google.com with ESMTPS id n12sm16368249ani.7.2012.11.27.03.52.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 03:52:48 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Nov 2012 09:55:03 -0200
Message-Id: <1354017303-22536-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1354017303-22536-1-git-send-email-otavio@ossystems.com.br>
References: <1354017303-22536-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] initramfs-framework: init: Stop mount warnings during boot
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
X-List-Received-Date: Tue, 27 Nov 2012 12:07:04 -0000

For a completely quiet boot using recent versions of utilities, the
/etc/fstab and /var/lock need to be available.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/initrdscripts/initramfs-framework/init   |    7 +++++--
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb |    2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
index fc4b0db..0be8f4d 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
@@ -68,8 +68,11 @@ MODULE_PRE_HOOKS=""  # functions to call before running each module
 MODULE_POST_HOOKS="" # functions to call after running each module
 MODULES_DIR=/init.d  # place to look for modules
 
-# initialize /proc and /sys
-mkdir -p /proc /sys
+# make mount stop complaining about missing /etc/fstab
+touch /etc/fstab
+
+# initialize /proc, /sys and /var/lock
+mkdir -p /proc /sys /var/lock
 mount -t proc proc /proc
 mount -t sysfs sysfs /sys
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index cbb4a39..fac356c 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 RDEPENDS = "busybox"
 
-PR = "r2"
+PR = "r3"
 
 inherit allarch
 
-- 
1.7.10.4



