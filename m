Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 40BA065D40
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 19:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sB4Jmusc013891; Thu, 4 Dec 2014 19:48:56 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hBX_KJTECzhk; Thu,  4 Dec 2014 19:48:56 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sB4JmhM9013878
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 4 Dec 2014 19:48:54 GMT
Message-ID: <1417722559.15614.58.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Iorga, Cristian" <cristian.iorga@intel.com>
Date: Thu, 04 Dec 2014 19:49:19 +0000
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB2F3C5556@IRSMSX105.ger.corp.intel.com>
References: <1417087023-29423-1-git-send-email-gshastri@juniper.net>
	<969F26A8BAB325438E7EB80D3C3134FB2F3C5556@IRSMSX105.ger.corp.intel.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"gmshastri@gmail.com" <gmshastri@gmail.com>
Subject: Re: [PATCH] When building with systemd based image, udev-hwdb postinstall script will fail because of not passing	correct CPU option. So fix it by passing correct QEMU_OPTIONS.
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
X-List-Received-Date: Thu, 04 Dec 2014 19:54:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I have a suspicion the whole QEMU_OPTIONS thing got totally broken by Martin's commit:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=7efad8a1b56df6ee07c12ad360c0493d7b1d6d23

since the things being appended are not overrides, they're PACKAGE_ARCH
values. My change below may give us a way out of the current set of
problems.

From 8a8b35a02244cf04b6fb368bf1cb4c1edda8d7a6 Mon Sep 17 00:00:00 2001
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Thu, 4 Dec 2014 19:41:27 +0000
Subject: qemu/libc-package: Fix qemu option handling

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index c1bc399..eb76ff9 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -298,9 +298,7 @@ python package_do_split_gconvs () {
                 --inputfile=%s/i18n/locales/%s --charmap=%s %s" \
                 % (treedir, datadir, locale, encoding, name)
 
-            qemu_options = d.getVar("QEMU_OPTIONS_%s" % d.getVar('PACKAGE_ARCH', True), True)
-            if not qemu_options:
-                qemu_options = d.getVar('QEMU_OPTIONS', True)
+            qemu_options = d.getVar('QEMU_OPTIONS', True)
 
             cmd = "PSEUDO_RELOADED=YES PATH=\"%s\" I18NPATH=\"%s\" %s -L %s \
                 -E LD_LIBRARY_PATH=%s %s %s/bin/localedef %s" % \
diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index b2cf85d..1c5736f 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -29,20 +29,20 @@ def qemu_run_binary(data, rootfs_path, binary):
 
     libdir = rootfs_path + data.getVar("libdir", False)
     base_libdir = rootfs_path + data.getVar("base_libdir", False)
-    oldest_kernel = data.getVar("OLDEST_KERNEL", True)
+    qemu_options = data.getVar("QEMU_OPTIONS", True)
 
-    return "PSEUDO_UNLOAD=1 " + qemu_binary + " -r " + oldest_kernel + " -L " + rootfs_path\
+    return "PSEUDO_UNLOAD=1 " + qemu_binary + " " + qemu_options + " -L " + rootfs_path\
             + " -E LD_LIBRARY_PATH=" + libdir + ":" + base_libdir + " "\
             + rootfs_path + binary
 
-QEMU_OPTIONS = "-r ${OLDEST_KERNEL}"
-QEMU_OPTIONS_append_iwmmxt    = " -cpu pxa270-c5"
-QEMU_OPTIONS_append_armv6     = " -cpu arm1136"
-QEMU_OPTIONS_append_armv7a    = " -cpu cortex-a8"
-QEMU_OPTIONS_append_e500v2    = " -cpu e500v2"
-QEMU_OPTIONS_append_e500mc    = " -cpu e500mc"
-QEMU_OPTIONS_append_e5500     = " -cpu e5500"
-QEMU_OPTIONS_append_e5500-64b = " -cpu e5500"
-QEMU_OPTIONS_append_e6500     = " -cpu e6500"
-QEMU_OPTIONS_append_e6500-64b = " -cpu e6500"
-QEMU_OPTIONS_append_ppc7400   = " -cpu 7400"
+QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH', True), True) or ""}"
+QEMU_EXTRAOPTIONS_iwmmxt    = " -cpu pxa270-c5"
+QEMU_EXTRAOPTIONS_armv6     = " -cpu arm1136"
+QEMU_EXTRAOPTIONS_armv7a    = " -cpu cortex-a8"
+QEMU_EXTRAOPTIONS_e500v2    = " -cpu e500v2"
+QEMU_EXTRAOPTIONS_e500mc    = " -cpu e500mc"
+QEMU_EXTRAOPTIONS_e5500     = " -cpu e5500"
+QEMU_EXTRAOPTIONS_e5500-64b = " -cpu e5500"
+QEMU_EXTRAOPTIONS_e6500     = " -cpu e6500"
+QEMU_EXTRAOPTIONS_e6500-64b = " -cpu e6500"
+QEMU_EXTRAOPTIONS_ppc7400   = " -cpu 7400"



