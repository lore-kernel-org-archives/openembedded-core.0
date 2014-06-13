Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C97A96FCAD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 07:58:43 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5D7wcqB002945 for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 08:58:38 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id tJ2nYbR8G2MS
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 08:58:38 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5D7wZXY002942
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 08:58:37 +0100
Message-ID: <1402646310.12440.471.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Jun 2014 08:58:30 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] elfutils: Fix debugedit failure in grub
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
X-List-Received-Date: Fri, 13 Jun 2014 07:58:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We've seeing occasional debugedit failures in grub during do_package
which in turn are coming from section alignment failures from libelf.
The failures occur when gold is used to link grub instead of ld.bfd.

"readelf -e uhci.module" shows:

Section Headers:
  [Nr] Name              Type            Addr     Off    Size   ES Flg Lk Inf Al
  [12] .note.GNU-stack   PROGBITS        00000000 0010ce 000000 00      0   0  1

in a good build and:

Section Headers:
  [Nr] Name              Type            Addr     Off    Size   ES Flg Lk Inf Al
  [24] .note.GNU-stack   PROGBITS        00000000 009180 000000 00      0   0  0

in a bad build. The problem is the "Al" (alignment) change from 1 to 0.
If its 0, debugedit complains.

As far as I can tell, the alignment of a zero length section is not
an issue and the check in libelf should check the section size and only
give alignment errors if there is some data to align.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/elfutils/elfutils-0.158/fixheadercheck.patch b/meta/recipes-devtools/elfutils/elfutils-0.158/fixheadercheck.patch
new file mode 100644
index 0000000..8796e9a
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.158/fixheadercheck.patch
@@ -0,0 +1,24 @@
+For some binaries we can get a invalid section alignment, for example if 
+sh_align = 1 and sh_addralign is 0. In the case of a zero size section like 
+".note.GNU-stack", this is irrelavent as far as I can tell and we shouldn't
+error in this case.
+
+RP 2014/6/11
+
+Upstream-Status: Pending
+
+Index: elfutils-0.158/libelf/elf32_updatenull.c
+===================================================================
+--- elfutils-0.158.orig/libelf/elf32_updatenull.c	2012-12-14 22:40:48.000000000 +0000
++++ elfutils-0.158/libelf/elf32_updatenull.c	2014-06-11 16:35:43.417386291 +0000
+@@ -327,8 +327,8 @@
+ 		     we test for the alignment of the section being large
+ 		     enough for the largest alignment required by a data
+ 		     block.  */
+-		  if (unlikely (! powerof2 (shdr->sh_addralign))
+-		      || unlikely (shdr->sh_addralign < sh_align))
++		  if (shdr->sh_size && (unlikely (! powerof2 (shdr->sh_addralign))
++		      || unlikely (shdr->sh_addralign < sh_align)))
+ 		    {
+ 		      __libelf_seterrno (ELF_E_INVALID_ALIGN);
+ 		      return -1;
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.158.bb b/meta/recipes-devtools/elfutils/elfutils_0.158.bb
index e425364..ef3dd0b 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.158.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.158.bb
@@ -25,13 +25,11 @@ SRC_URI += "\
         file://core_filename.patch \
         file://CVE-2014-0172.patch \
         file://unwind_non_linux.patch \
-"
-
-SRC_URI += " \
-	file://elf_additions.diff \
-	file://mempcpy.patch \
-	file://dso-link-change.patch \
-	file://m4-biarch.m4-tweak-AC_RUN_IFELSE-for-cross-compiling.patch \
+        file://elf_additions.diff \
+        file://mempcpy.patch \
+        file://dso-link-change.patch \
+        file://m4-biarch.m4-tweak-AC_RUN_IFELSE-for-cross-compiling.patch \
+        file://fixheadercheck.patch \
 "
 
 # Only apply when building uclibc based target recipe



