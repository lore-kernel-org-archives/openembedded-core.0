Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SAyMk-0005sO-Jh
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 07:52:50 +0100
Received: by wibhj13 with SMTP id hj13so1515699wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 23:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=B5bQ+fkMt38vtJoEThWVIPVnGo+axPU4Hu6HzojfpAo=;
	b=tdXispUyCf7HNpCfl2H68eGTJTG/r0STUMSGMl+CAkUk9oy2MWmNXZs2xQJcD1Jhce
	liJ6Ib95fFUbxELADSLkyjEoAClMcjTU0joVlU8wAFcDBSC+ArJBa42lmq4GV4P78J8m
	urAA9X95B/Bo4WvUciWTO6sl/qHjsINH3xId/7cZOC8arb+ennq76d5xT8pYoF9t2Ytn
	21BuYp6+B+mXqQeBygQvcGtSNaaRTbj0nqddI9LBEEGgZ7aBPJdrEDIAO9pfztwBOBdU
	/FcNJDQcWI6RuxTIM3nRQeIjUnUNBvbhT26ayaXiYzeRBCXPmx6GLIiW16l5ixdPpvcn
	9FvQ==
Received: by 10.180.79.135 with SMTP id j7mr3710448wix.19.1332485034773;
	Thu, 22 Mar 2012 23:43:54 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gp8sm11356199wib.5.2012.03.22.23.43.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 23:43:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 07:43:49 +0100
Message-Id: <1332485029-9148-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
Subject: [PATCH] kernel.bbclass: populate /etc/modules-load.d/ with module_autoload entries too
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
X-List-Received-Date: Fri, 23 Mar 2012 06:52:52 -0000

* /etc/modules-load.d/foo.conf is used by systemd like /etc/modutils/foo was with sysvinit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 169df33..975ae13 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -122,6 +122,7 @@ kernel_do_install() {
 	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
 	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION}
 	install -d ${D}/etc/modutils
+	install -d ${D}/etc/modules-load.d
 	install -d ${D}/etc/modprobe.d
 
 	#
@@ -411,6 +412,11 @@ python populate_packages_prepend () {
 			for m in autoload.split():
 				f.write('%s\n' % m)
 			f.close()
+			name = '%s/etc/modules-load.d/%s.conf' % (dvar, basename)
+			f = open(name, 'w')
+			for m in autoload.split():
+				f.write('%s\n' % m)
+			f.close()
 			postinst = d.getVar('pkg_postinst_%s' % pkg, True)
 			if not postinst:
 				bb.fatal("pkg_postinst_%s not defined" % pkg)
@@ -426,7 +432,7 @@ python populate_packages_prepend () {
 			f.close()
 
 		files = d.getVar('FILES_%s' % pkg, True)
-		files = "%s /etc/modutils/%s /etc/modutils/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename, basename)
+		files = "%s /etc/modutils/%s /etc/modutils/%s.conf /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename, basename, basename)
 		d.setVar('FILES_%s' % pkg, files)
 
 		if vals.has_key("description"):
@@ -456,7 +462,7 @@ python populate_packages_prepend () {
 	# avoid warnings. removedirs only raises an OSError if an empty
 	# directory cannot be removed.
 	dvar = d.getVar('PKGD', True)
-	for dir in ["%s/etc/modutils" % (dvar), "%s/etc/modprobe.d" % (dvar)]:
+	for dir in ["%s/etc/modutils" % (dvar), "%s/etc/modprobe.d" % (dvar), "%s/etc/modules-load.d" % (dvar)]:
 		if len(os.listdir(dir)) == 0:
 			os.rmdir(dir)
 
-- 
1.7.8.5



