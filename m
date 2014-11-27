Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 80DF872366
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 14:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sAREvlOj013403 for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 14:57:47 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id yPwPALjzTjFM
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 14:57:47 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sAREvZJB013380
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 14:57:46 GMT
Message-ID: <1417100291.15614.12.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Nov 2014 14:58:11 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] gcc-4.8: Drop unused patch
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
X-List-Received-Date: Thu, 27 Nov 2014 14:58:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I disabled this patch as it became obsolete some time ago but forgot to 
remove it, this cleans things up.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0051-fix-unwind-race.patch b/meta/recipes-devtools/gcc/gcc-4.8/0051-fix-unwind-race.patch
deleted file mode 100644
index e4fff12..0000000
--- a/meta/recipes-devtools/gcc/gcc-4.8/0051-fix-unwind-race.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-These is a race over the installation of files into the include/ directory between:
-
-| (cd `${PWDCMD-pwd}`/include ; \|  tar -cf - .; exit 0) | (cd /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-oecore/build/build/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gcc-cross-initial/4.8.2-r0/image/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-oecore/build/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib/armv5te-oe-linux-gnueabi.gcc-cross-initial/gcc/arm-oe-linux-gnueabi/4.8.2/include; tar xpf - )
-
-and
-
-| /bin/install -c -m 644 unwind.h /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-oecore/build/build/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gcc-cross-initial/4.8.2-r0/image/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-oecore/build/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib/armv5te-oe-linux-gnueabi.gcc-cross-initial/gcc/arm-oe-linux-gnueabi/4.8.2/include
-| /bin/install: cannot create regular file '/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-oecore/build/build/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gcc-cross-initial/4.8.2-r0/image/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-oecore/build/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib/armv5te-oe-linux-gnueabi.gcc-cross-initial/gcc/arm-oe-linux-gnueabi/4.8.2/include/unwind.h': File exists
-| make[1]: *** [install-unwind_h] Error 1
-
-which under the right circumstances leads to the above build failure. Since we don't 
-need two copies of this file and we don't use install-no-fixincludes, we can disable 
-the libgcc installation.
-
-RP 2014/04/10
-
-Upstream-Status: Pending [would need a rewrite into an acceptable patch form]
-
-Index: gcc-4.8.2/libgcc/Makefile.in
-===================================================================
---- gcc-4.8.2.orig/libgcc/Makefile.in	2013-02-04 19:06:20.000000000 +0000
-+++ gcc-4.8.2/libgcc/Makefile.in	2014-04-10 09:58:33.018748787 +0000
-@@ -1020,8 +1020,8 @@
- # This is however useful for "install-no-fixincludes" case, when only the gcc
- # internal headers are copied by gcc's install.
- install-unwind_h:
--	$(mkinstalldirs) $(DESTDIR)$(libsubdir)/include
--	$(INSTALL_DATA) unwind.h $(DESTDIR)$(libsubdir)/include
-+#	$(mkinstalldirs) $(DESTDIR)$(libsubdir)/include
-+#	$(INSTALL_DATA) unwind.h $(DESTDIR)$(libsubdir)/include
- 
- all: install-unwind_h-forbuild
- 



