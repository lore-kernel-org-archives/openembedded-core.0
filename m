Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sys7F-0002vz-LC for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 00:19:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q77M7JYv016388
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Aug 2012 23:07:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15897-02 for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2012 23:07:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q77M79Ww016381
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Aug 2012 23:07:10 +0100
Message-ID: <1344377233.9756.305.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 07 Aug 2012 23:07:13 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: gcc: Disable use of sdt.h header
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
X-List-Received-Date: Tue, 07 Aug 2012 22:19:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The target sysroot might contain sdt.h but we don't list this in DEPENDS
and shouldn't be referencing it. Unfortunately there is no way to tell
configure this since these tests are uncached and we can't force
a particular value. The only option is therefore to patch this out.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 4905155..4ad4819 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -74,6 +74,7 @@ SRC_URI = "git://github.com/mirrors/gcc.git;branch=${BRANCH};protocol=git \
 	   file://arm-hard-float-loader.patch \
 	   file://gcc-argument-list-too-long.patch \
 	   file://fix-g++-sysroot.patch \
+	   file://disablesdt.patch \
 	  "
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
diff --git a/meta/recipes-devtools/gcc/gcc-4.7/disablesdt.patch b/meta/recipes-devtools/gcc/gcc-4.7/disablesdt.patch
new file mode 100644
index 0000000..8946afc
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.7/disablesdt.patch
@@ -0,0 +1,32 @@
+We don't list dtrace in DEPENDS so we shouldn't be depending on this header. 
+It may or may not exist from preivous builds though. To be determinstic, disable
+sdt.h usage always. This avoids build failures if the header is removed after configure
+but before libgcc is compiled for example.
+
+RP 2012/8/7
+
+Upstream-Status: Inappropriate [hack]
+
+Index: git/gcc/configure
+===================================================================
+--- git.orig/gcc/configure	2012-08-07 21:18:42.319247701 +0000
++++ git/gcc/configure	2012-08-07 21:19:08.939247082 +0000
+@@ -26758,12 +26758,12 @@
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking sys/sdt.h in the target C library" >&5
+ $as_echo_n "checking sys/sdt.h in the target C library... " >&6; }
+ have_sys_sdt_h=no
+-if test -f $target_header_dir/sys/sdt.h; then
+-  have_sys_sdt_h=yes
+-
+-$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
+-
+-fi
++#if test -f $target_header_dir/sys/sdt.h; then
++#  have_sys_sdt_h=yes
++#
++#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
++#
++#fi
+ { $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_sys_sdt_h" >&5
+ $as_echo "$have_sys_sdt_h" >&6; }
+ 




