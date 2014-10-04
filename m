Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id E368B71547
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Oct 2014 02:26:57 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id b13so2766105wgh.34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Oct 2014 19:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=seZ3VDbaIBCpWV3CQ/dOKvPKFPJ93PK+dq0gvDRg1YM=;
	b=RgxZwuWWm5LNM2u6u3OC3TEYX/dCqdXWtEXRNjxEGWy5Xr9Lc6QH9AnOeMHvK5tJSP
	4OPLqRvvkcYZx9gp5QAFfw7FszcxOttz6bkWhG6/AaT6X2lYIggze5LyAkjx6835RekD
	IdYiTA0Rw+hZR9pcNObC7bKiJFcftO6l1jtnGRCQ8B6KxCoxWUstDzpFI3EpnVcpHuxU
	lcvyVZC0DDmKFWnYgId6UcwqnBIG0gYRhWvM8qnRDnAT9pgk0Zuyg26p5B+XH4wiOb5C
	/SzHrjSTNatp/TaXYPAIFWpefY4fFpDFy5ai6K6tJ6y5P5p8j80Zi1ODdFxAEUULONvf
	y+OA==
X-Received: by 10.194.95.234 with SMTP id dn10mr11917745wjb.73.1412389618414; 
	Fri, 03 Oct 2014 19:26:58 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bj7sm9601791wjc.33.2014.10.03.19.26.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Oct 2014 19:26:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Oct 2014 04:27:55 +0200
Message-Id: <1412389675-13389-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.1
Subject: [WIP][PATCH] systemd: don't move libgudev around, it breaks libgudev-1.0.la
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
X-List-Received-Date: Sat, 04 Oct 2014 02:26:58 -0000

* libgudev-1.0.la still references /usr/lib and this change was breaking gypsy (detected in navit) and
  network-manager-applet

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/systemd/systemd_216.bb | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_216.bb
index ebf9395..2779823 100644
--- a/meta/recipes-core/systemd/systemd_216.bb
+++ b/meta/recipes-core/systemd/systemd_216.bb
@@ -129,9 +129,6 @@ do_install() {
 		sed -i s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
 	fi
 
-	# Move libgudev back to ${rootlibdir} to keep backward compatibility
-	[ ${rootlibdir} != ${libdir} ] && mv -t ${D}${rootlibdir} ${D}${libdir}/libgudev*
-
         # Delete journal README, as log can be symlinked inside volatile.
         rm -f ${D}/${localstatedir}/log/README
 
@@ -171,10 +168,10 @@ python populate_packages_prepend (){
     systemdlibdir = d.getVar("rootlibdir", True)
     do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
 }
-PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd).*"
+PACKAGES_DYNAMIC += "^lib(udev|systemd).*"
 
 PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install \
-             ${PN}-rpm-macros ${PN}-binfmt ${PN}-pam ${PN}-zsh"
+             ${PN}-rpm-macros ${PN}-binfmt ${PN}-pam ${PN}-zsh libgudev"
 
 SYSTEMD_PACKAGES = "${PN}-binfmt"
 SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
@@ -188,6 +185,8 @@ FILES_${PN}-analyze = "${bindir}/systemd-analyze"
 FILES_${PN}-initramfs = "/init"
 RDEPENDS_${PN}-initramfs = "${PN}"
 
+FILES_libgudev = "${libdir}/libgudev*${SOLIBS}"
+
 # The test cases need perl and bash to run correctly.
 RDEPENDS_${PN}-ptest += "perl bash"
 FILES_${PN}-ptest += "${libdir}/udev/rules.d"
-- 
2.1.1


