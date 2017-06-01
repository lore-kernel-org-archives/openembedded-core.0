Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id 7C54377DAF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 15:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; 
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=4j13ojxkCrICnj3xzlCM2BIqIgpmzNGqasPDtXf8W3w=; 
	b=EPteVMTg5LD6lE0dcz3z/KA7+8wDaFtkhmct7NuLgv4+UXnz/B/EFxSSk75MR3rXc9aXASxD94MNspyXlja3u05nG878E+7PB6gvRp/b96asGQILvQmgjXABWNeMTIsOabHN6jntQLlThjHSBQxLGxjmxq0W3z+5ZbNmqiVER5uf9dGcY8tS5tYB75tswO+snv9w5cabhy92zQ9e3myHALnPPoZRl2Xz8E6RnZZfUEmkGwO+/uZqUhDfifrae69maKopVEYM3K60//pBHB9fVTrn4E4kYpTtXFQpFW9W5W38KxC8WRijb3Bptf+OL5GJcE/S8DA26GVvXdxaQzOLEQ==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dGSPK-0005hy-F5; Thu, 01 Jun 2017 18:53:06 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dGSPK-0001VI-Dc; Thu, 01 Jun 2017 18:53:06 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: poky@yoctoproject.org
Date: Thu,  1 Jun 2017 18:52:59 +0300
Message-Id: <1496332379-3802-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <20170601125029.wli6reydiovo7xjk@hiutale>
References: <20170601125029.wli6reydiovo7xjk@hiutale>
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3 v2] scripts: Fix return value checks from subprocess.call()'s
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
X-List-Received-Date: Thu, 01 Jun 2017 15:53:05 -0000

Python function subprocess.call() returns the return value of the
executed process. If return values are not checked, errors may
go unnoticed and bad things can happen.

Change all callers of subprocess.call() which do not check for
the return value to use subprocess.check_call() which raises
CalledProcessError if the subprocess returns with non-zero value.

https://docs.python.org/2/library/subprocess.html#using-the-subprocess-module

All users of the function were found with:

$ git grep "subprocess\.call" | \
  egrep -v 'if.*subprocess\.call|=\ +subprocess\.call|return.*subprocess\.call'

Tested similar patch on top of yocto jethro. Only compile tested
core-image-minimal on poky master branch.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 scripts/runqemu | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

v2:
split patches to bitbake, meta and scripts

v1:
http://lists.openembedded.org/pipermail/openembedded-core/2017-May/136901.html

diff --git a/scripts/runqemu b/scripts/runqemu
index 72c4176..416c3f7 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1098,7 +1098,7 @@ class BaseConfig(object):
         if self.serialstdio:
             logger.info("Interrupt character is '^]'")
             cmd = "stty intr ^]"
-            subprocess.call(cmd, shell=True)
+            subprocess.check_call(cmd, shell=True)
 
             first_serial = ""
             if not re.search("-nographic", self.qemu_opt):
@@ -1145,7 +1145,7 @@ class BaseConfig(object):
         if self.cleantap:
             cmd = 'sudo %s %s %s' % (self.qemuifdown, self.tap, self.bindir_native)
             logger.info('Running %s' % cmd)
-            subprocess.call(cmd, shell=True)
+            subprocess.check_call(cmd, shell=True)
         if self.lock_descriptor:
             logger.info("Releasing lockfile for tap device '%s'" % self.tap)
             self.release_lock()
@@ -1154,11 +1154,11 @@ class BaseConfig(object):
             logger.info("Shutting down the userspace NFS server...")
             cmd = "runqemu-export-rootfs stop %s" % self.rootfs
             logger.info('Running %s' % cmd)
-            subprocess.call(cmd, shell=True)
+            subprocess.check_call(cmd, shell=True)
 
         if self.saved_stty:
             cmd = "stty %s" % self.saved_stty
-            subprocess.call(cmd, shell=True)
+            subprocess.check_call(cmd, shell=True)
 
         if self.clean_nfs_dir:
             logger.info('Removing %s' % self.rootfs)
-- 
1.9.1


