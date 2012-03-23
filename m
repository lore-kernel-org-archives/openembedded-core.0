Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SB4BQ-0002HH-FL
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 14:05:32 +0100
Received: by wgbds1 with SMTP id ds1so982926wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 05:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=B5bQ+fkMt38vtJoEThWVIPVnGo+axPU4Hu6HzojfpAo=;
	b=XPxb+nsylicXccrQXidlA6xd1nIrqrh+CdyuvBDb6wxgSXHgGrJBC2mzD++9jLXuE3
	DyV7Df9FNalEWFnEDKXTtebKWeV2ih+QdL2ZgmpCDQoHS0KfFMasIfOxlq2/XLzH3CtK
	F8ULb0N13afRH3mV6BD/BcVdG3DJ7ANCviolKcogSV7Nenp6jQ6PcS8Iw9MB/NueVU5p
	/LT2z4rKFhXMNhhFYMfCyvBhHEiVSCp+Sh/3FU6M2zHn29JXMF+s5bjz5PNF+sW0L9+9
	ch6K2f+m4JpbsRkZxYeLrBsEWFHtgKHYSe0Gu+jRvvcOK0ysVea0xE5b1NAQNlU0R/d6
	d/ug==
Received: by 10.180.83.72 with SMTP id o8mr6405221wiy.5.1332507396358;
	Fri, 23 Mar 2012 05:56:36 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fn2sm22797956wib.0.2012.03.23.05.56.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 05:56:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 13:56:26 +0100
Message-Id: <dc50f1d1204c1c48d8d4a5acb40edf619b306522.1332507302.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1332507302.git.Martin.Jansa@gmail.com>
References: <cover.1332507302.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/6] kernel.bbclass: populate /etc/modules-load.d/ with module_autoload entries too
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
X-List-Received-Date: Fri, 23 Mar 2012 13:05:32 -0000

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



