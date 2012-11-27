Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TdKKw-0007JN-W3
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 13:32:42 +0100
Received: by mail-gh0-f175.google.com with SMTP id z2so1321906ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2012 04:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=YLBH2BMwzJbAiayqNQyz4H33yxRb5V58OPjP3JFgR8w=;
	b=pxP99zIkDbX5/g5bZUr+S0NuSoWs/25itJrXjS+y/UNhwPj9sLgsBE9iltXhTPUhLM
	qlk73K+iMuRz5ALatozqwWl0j2NkzRbF6qdTvkhXx2ozlZOtHHpA7TbiZ+lIIK3JeaNw
	BgyVu4q2hfzY5VN10oBE8G7+lQn3RxRRuWnDgPZlOzWkql8uAy8XeobzoAqWuHa7JLUC
	B+BZQyLaML2WTQrx9jNOld1QUBq3EQJ7vUxhfjnfCiEpmWET5I1g02fZaA+7+RfaJ6hw
	/CkfslBKb0YEQYP5zJJI+x79J2sVZqE/W6r+yOw2c4iolQFW2M2yxBPRx1PfzNmAZ5L/
	1q/g==
Received: by 10.236.81.209 with SMTP id m57mr14744204yhe.84.1354018676205;
	Tue, 27 Nov 2012 04:17:56 -0800 (PST)
Received: from nano.lab.ossystems.com.br.lab.ossystems.com.br
	([177.100.163.15])
	by mx.google.com with ESMTPS id v8sm18136452yhi.15.2012.11.27.04.17.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 04:17:55 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Nov 2012 10:20:07 -0200
Message-Id: <1354018807-23083-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1354018807-23083-1-git-send-email-otavio@ossystems.com.br>
References: <1354018807-23083-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [for-danny][PATCH 3/3] initramfs-framework: init: Stop mount warnings during boot
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
X-List-Received-Date: Tue, 27 Nov 2012 12:32:43 -0000

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



