Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SB4By-0002LV-6i
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 14:06:06 +0100
Received: by mail-wi0-f177.google.com with SMTP id hj13so1834513wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 05:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=7xVTsdLtXGe9XpJlif1STY/ArvCPbNfwAZUwZ4vzjzM=;
	b=OtknjPKI3gDmjxuCm0GLlQGct51pawXX2Vs2zaTYcBzaYOsElQk19cFI99LJQIN6NS
	UDEg7SQxKmXyWh6L7mYjX+2esQHw0kEIfKpcJ5uWqtxVAsd0jI9d9HAPf4YlCXG35C6X
	KDHEAuBNGVfGy6KrrIZXCbegYLT2M7SyAGvwQeWyddjt95EKXAVDI16WKQNSb+HRI42k
	2/74t0w4iTSNxqqWvWkgfhmzynQ5QWtHt1JqGrq1lrGBt1x+tcWimsG6B8uo/tnaXAER
	TmAOSrrAxr/pxxsamrjB9MjXNwSiZqmCUFnHkiAUk1xvEsRsMxLlnugYr8lBpcbEhLyC
	Zehw==
Received: by 10.180.89.130 with SMTP id bo2mr6370206wib.17.1332507432424;
	Fri, 23 Mar 2012 05:57:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gp8sm13665969wib.5.2012.03.23.05.57.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 05:57:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 13:56:31 +0100
Message-Id: <a64b44d3b5acab26e849a1c788b98a04ded719bb.1332507302.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <dc50f1d1204c1c48d8d4a5acb40edf619b306522.1332507302.git.Martin.Jansa@gmail.com>
References: <dc50f1d1204c1c48d8d4a5acb40edf619b306522.1332507302.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332507302.git.Martin.Jansa@gmail.com>
References: <cover.1332507302.git.Martin.Jansa@gmail.com>
Subject: [PATCH 6/6] kernel.bbclass: don't create /etc/modutils/*
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
X-List-Received-Date: Fri, 23 Mar 2012 13:06:06 -0000

* update-modules was updated to read /etc/modules-load.d/*.conf

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass |   12 ++++--------
 1 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 736768e..6633b85 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -123,7 +123,6 @@ kernel_do_install() {
 	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
 	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
 	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION}
-	install -d ${D}/etc/modutils
 	install -d ${D}/etc/modules-load.d
 	install -d ${D}/etc/modprobe.d
 
@@ -411,7 +410,7 @@ python populate_packages_prepend () {
 
 		dvar = d.getVar('PKGD', True)
 
-		# If autoloading is requested, output /etc/modutils/<name> and append
+		# If autoloading is requested, output /etc/modules-load.d/<name>.conf and append
 		# appropriate modprobe commands to the postinst
 		autoload = d.getVar('module_autoload_%s' % basename, True)
 		if autoload:
@@ -420,9 +419,6 @@ python populate_packages_prepend () {
 			for m in autoload.split():
 				f.write('%s\n' % m)
 			f.close()
-			modutils_name = '%s/etc/modutils/%s' % (dvar, basename)
-			modutils_target = '../modules-load.d/%s.conf' % (basename)
-			os.symlink(modutils_target, modutils_name)
 			postinst = d.getVar('pkg_postinst_%s' % pkg, True)
 			if not postinst:
 				bb.fatal("pkg_postinst_%s not defined" % pkg)
@@ -438,7 +434,7 @@ python populate_packages_prepend () {
 			f.close()
 
 		files = d.getVar('FILES_%s' % pkg, True)
-		files = "%s /etc/modutils/%s /etc/modutils/%s.conf /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename, basename, basename)
+		files = "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename)
 		d.setVar('FILES_%s' % pkg, files)
 
 		if vals.has_key("description"):
@@ -464,11 +460,11 @@ python populate_packages_prepend () {
 	do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.cis$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
 	do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='update-modules kernel-%s' % d.getVar("KERNEL_VERSION", True))
 
-	# If modutils and modprobe.d are empty at this point, remove them to
+	# If modules-load.d and modprobe.d are empty at this point, remove them to
 	# avoid warnings. removedirs only raises an OSError if an empty
 	# directory cannot be removed.
 	dvar = d.getVar('PKGD', True)
-	for dir in ["%s/etc/modutils" % (dvar), "%s/etc/modprobe.d" % (dvar), "%s/etc/modules-load.d" % (dvar)]:
+	for dir in ["%s/etc/modprobe.d" % (dvar), "%s/etc/modules-load.d" % (dvar)]:
 		if len(os.listdir(dir)) == 0:
 			os.rmdir(dir)
 
-- 
1.7.8.5



