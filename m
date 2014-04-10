Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7F0D665D6D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 10:11:06 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s3AAB2BD018495 for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 11:11:02 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id b5nQ3tgo1jWn
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 11:11:02 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s3AAB0xM018481
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 11:11:01 +0100
Message-ID: <1397124654.24597.239.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Apr 2014 11:10:54 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] gcc: Fix a race over unwind.h
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
X-List-Received-Date: Thu, 10 Apr 2014 10:11:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There are two places unwind.h is installed, even by the Makefile's admission.
Disable one of them to prevent build failure races.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
index 855ec26..c320600 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
@@ -71,6 +71,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://0048-PR58854_fix_arm_apcs_epilogue.patch \
 	   file://0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch \
 	   file://0050-PR-target-58595.patch \
+	   file://0051-fix-unwind-race.patch \
 	  "
 SRC_URI[md5sum] = "a3d7d63b9cb6b6ea049469a0c4a43c9d"
 SRC_URI[sha256sum] = "09dc2276c73424bbbfda1dbddc62bbbf900c9f185acf7f3e1d773ce2d7e3cdc8"
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0051-fix-unwind-race.patch b/meta/recipes-devtools/gcc/gcc-4.8/0051-fix-unwind-race.patch
new file mode 100644
index 0000000..e4fff12
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.8/0051-fix-unwind-race.patch
@@ -0,0 +1,33 @@
+These is a race over the installation of files into the include/ directory between:
+
+| (cd `${PWDCMD-pwd}`/include ; \|  tar -cf - .; exit 0) | (cd /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-oecore/build/build/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gcc-cross-initial/4.8.2-r0/image/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-oecore/build/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib/armv5te-oe-linux-gnueabi.gcc-cross-initial/gcc/arm-oe-linux-gnueabi/4.8.2/include; tar xpf - )
+
+and
+
+| /bin/install -c -m 644 unwind.h /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-oecore/build/build/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gcc-cross-initial/4.8.2-r0/image/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-oecore/build/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib/armv5te-oe-linux-gnueabi.gcc-cross-initial/gcc/arm-oe-linux-gnueabi/4.8.2/include
+| /bin/install: cannot create regular file '/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-oecore/build/build/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gcc-cross-initial/4.8.2-r0/image/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-oecore/build/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib/armv5te-oe-linux-gnueabi.gcc-cross-initial/gcc/arm-oe-linux-gnueabi/4.8.2/include/unwind.h': File exists
+| make[1]: *** [install-unwind_h] Error 1
+
+which under the right circumstances leads to the above build failure. Since we don't 
+need two copies of this file and we don't use install-no-fixincludes, we can disable 
+the libgcc installation.
+
+RP 2014/04/10
+
+Upstream-Status: Pending [would need a rewrite into an acceptable patch form]
+
+Index: gcc-4.8.2/libgcc/Makefile.in
+===================================================================
+--- gcc-4.8.2.orig/libgcc/Makefile.in	2013-02-04 19:06:20.000000000 +0000
++++ gcc-4.8.2/libgcc/Makefile.in	2014-04-10 09:58:33.018748787 +0000
+@@ -1020,8 +1020,8 @@
+ # This is however useful for "install-no-fixincludes" case, when only the gcc
+ # internal headers are copied by gcc's install.
+ install-unwind_h:
+-	$(mkinstalldirs) $(DESTDIR)$(libsubdir)/include
+-	$(INSTALL_DATA) unwind.h $(DESTDIR)$(libsubdir)/include
++#	$(mkinstalldirs) $(DESTDIR)$(libsubdir)/include
++#	$(INSTALL_DATA) unwind.h $(DESTDIR)$(libsubdir)/include
+ 
+ all: install-unwind_h-forbuild
+ 



