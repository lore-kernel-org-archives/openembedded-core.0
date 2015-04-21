Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id BE5896E268
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 10:53:41 +0000 (UTC)
Received: by wiax7 with SMTP id x7so104393867wia.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 03:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ta5pr4OarlxiWF24+NaTlLjhXHkNE++x2ZpFCrxhkzc=;
	b=z5gURmfIMmcuHbBVmzKEar9MTSKZBpnZsdb5Mxxp51ek1Xlukq8d1ymtF8UGE3WfbY
	CfyMFO1aOjf+d4wrhQpR4iKestlKnlV9p4gNgubvr2NzNBA5EXzMeLw0to77TUlivjmF
	uoTCNHIUjByEicOIHq42ZnO5ULVQG5pFDQlFLWsXSGotXvpPR59yAcUhbTdeFp1QUUIw
	3ZNxmaYsqUQa/mvY15FAYcgA0ql/nWu6MA9g+bmlwp7wmrc3OSxqYlY2iLnY4qJOEqig
	+jkEiU09IxPxpkukJJOjtabXHGtcYz6IQ3fpj4E/nZMLsXWZB0VUpH93cjsJmC2FSxfk
	9zNQ==
X-Received: by 10.180.160.145 with SMTP id xk17mr4640838wib.85.1429613622756; 
	Tue, 21 Apr 2015 03:53:42 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id r9sm2071086wjo.26.2015.04.21.03.53.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Apr 2015 03:53:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Apr 2015 12:53:39 +0200
Message-Id: <1429613620-2989-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1429613620-2989-1-git-send-email-Martin.Jansa@gmail.com>
References: <1429613620-2989-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [fido][PATCH 3/4] image.bbclass: Allow to remove do_rootfs -> virtual/kernel:do_packagedata dependency
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
X-List-Received-Date: Tue, 21 Apr 2015 10:53:42 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* this is causing dependency loops in some cases
  e.g. linux-hp-tenderloin depends on initramfs-android-image, but
    commit 41f0f86ec0a3e0b6f6c9bb4ef71a4215c00bf66c
    Author: Richard Purdie <richard.purdie@linuxfoundation.org>
    Date:   Tue Jan 27 15:24:52 2015 +0000
    Subject: image: Add missing depends on virtual/kernel for depmod data
  adds also dependency between <image>.do_rootfs and virtual/kernel:do_packagedata
  causing this dependency loop:

Dependency loop #1 found:
  Task 78 (meta-smartphone/meta-hp/recipes-kernel/linux/linux-hp-tenderloin_git.bb, do_install)
    (dependent Tasks ['linux-hp-tenderloin, do_compile',
                      'pseudo, do_populate_sysroot'])
  Task 88 (meta-smartphone/meta-hp/recipes-kernel/linux/linux-hp-tenderloin_git.bb, do_package)
    (dependent Tasks ['rpm, do_populate_sysroot',
                      'pseudo, do_populate_sysroot',
                      'linux-hp-tenderloin, do_install',
                      'initramfs-android-image.bb, do_packagedata',
                      'glibc, do_packagedata',
                      'file, do_populate_sysroot',
                      'gcc-runtime, do_packagedata'])
  Task 89 (meta-smartphone/meta-hp/recipes-kernel/linux/linux-hp-tenderloin_git.bb, do_package_write_ipk)
    (dependent Tasks ['linux-hp-tenderloin, do_package',
                      'opkg-utils, do_populate_sysroot',
                      'linux-hp-tenderloin, do_packagedata',
                      'pseudo, do_populate_sysroot'])
  Task 560 (meta-smartphone/meta-android/recipes-core/images/initramfs-android-image.bb, do_rootfs)
    (dependent Tasks ['bash, do_package_write_ipk',
                      'run-postinsts, do_package_write_ipk',
                      'db, do_package_write_ipk',
                      'update-rc.d, do_populate_sysroot',
                      'android-tools-conf, do_package_write_ipk',
		      'base-passwd, do_package_write_ipk',
                      'initramfs-boot-android, do_package_write_ipk',
		      'expat, do_package_write_ipk',
                      'bzip2, do_packagedata',
		      'glibc-initial, do_packagedata',
                      'openssl, do_package_write_ipk',
                      'bzip2, do_package_write_ipk',
		      'busybox, do_packagedata',
                      'zlib, do_packagedata',
		      'qemuwrapper-cross, do_packagedata',
                      'base-passwd, do_packagedata',
		      'busybox, do_package_write_ipk',
                      'zlib, do_package_write_ipk',
		      'qemuwrapper-cross, do_package_write_ipk',
		      'gcc-runtime, do_package_write_ipk',
		      'gettext, do_packagedata',
		      'initramfs-boot-android, do_packagedata',
		      'gettext, do_package_write_ipk',
		      'libgcc-initial, do_packagedata',
                      'expat, do_packagedata',
                      'gdbm, do_packagedata',
		      'depmodwrapper-cross, do_package_write_ipk',
                      'libgcc-initial, do_package_write_ipk',
                      'glibc-initial, do_package_write_ipk',
                      'linux-libc-headers, do_packagedata',
                      'glibc, do_packagedata',
                      'initramfs-android-image.bb, do_packagedata',
                      'glibc, do_package_write_ipk',
                      'sqlite3, do_packagedata',
                      'initramfs-android-image.bb, do_package_write_ipk',
                      'sqlite3, do_package_write_ipk',
                      'android-tools-conf, do_packagedata',
                      'ncurses, do_packagedata',
                      'openssl, do_packagedata',
                      'android-tools, do_packagedata',
                      'ncurses, do_package_write_ipk',
                      'cryptodev-linux, do_packagedata',
                      'android-tools, do_package_write_ipk',
                      'pseudo, do_populate_sysroot',
                      'cryptodev-linux, do_package_write_ipk',
                      'linux-libc-headers, do_package_write_ipk',
                      'depmodwrapper-cross, do_packagedata',
                      'linux-hp-tenderloin, do_packagedata',
                      'readline, do_package_write_ipk',
                      'opkg-utils, do_packagedata',
                      'linux-hp-tenderloin, do_package_write_ipk',
                      'python, do_packagedata',
                      'gdbm, do_package_write_ipk',
                      'opkg, do_populate_sysroot',
                      'python, do_package_write_ipk',
                      'libtool-cross, do_packagedata',
                      'db, do_packagedata',
                      'libgcc, do_packagedata',
                      'libtool-cross, do_package_write_ipk',
                      'update-rc.d, do_packagedata',
                      'update-rc.d, do_package_write_ipk',
                      'libgcc, do_package_write_ipk',
                      'opkg-utils, do_populate_sysroot',
                      'makedevs, do_populate_sysroot',
                      'readline, do_packagedata',
                      'base-files, do_packagedata',
                      'gcc-runtime, do_packagedata',
                      'opkg-utils, do_package_write_ipk',
                      'base-files, do_package_write_ipk',
                      'ldconfig-native, do_populate_sysroot',
                      'bash, do_packagedata',
                      'run-postinsts, do_packagedata'])
  Task 82 (meta-smartphone/meta-hp/recipes-kernel/linux/linux-hp-tenderloin_git.bb, do_compile)
    (dependent Tasks ['initramfs-android-image.bb, do_rootfs',
                      'linux-hp-tenderloin, do_configure'])

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image.bbclass | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 03cbbf7..dc9bd80 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -76,10 +76,17 @@ LDCONFIGDEPEND ?= "ldconfig-native:do_populate_sysroot"
 LDCONFIGDEPEND_libc-uclibc = ""
 LDCONFIGDEPEND_libc-musl = ""
 
+# This is needed to have depmod data in PKGDATA_DIR,
+# but if you're building small initramfs image
+# e.g. to include it in your kernel, you probably
+# don't want this dependency, which is causing dependency loop
+KERNELDEPMODDEPEND ?= "virtual/kernel:do_packagedata"
+
 do_rootfs[depends] += " \
     makedevs-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot ${LDCONFIGDEPEND} \
     virtual/update-alternatives-native:do_populate_sysroot update-rc.d-native:do_populate_sysroot \
-    virtual/kernel:do_packagedata"
+    ${KERNELDEPMODDEPEND} \
+"
 do_rootfs[recrdeptask] += "do_packagedata"
 
 def command_variables(d):
-- 
2.3.5


