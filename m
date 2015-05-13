Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EF8A474028
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 08:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4D88NsW027119 for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 09:08:23 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nTtCwgiaeuV8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 09:08:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4D889SJ027094
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 09:08:20 +0100
Message-ID: <1431504489.30971.154.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 13 May 2015 09:08:09 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] glibc: Fix x32 make race
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
X-List-Received-Date: Wed, 13 May 2015 08:08:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On x32 builds, sysd-syscalls appears malformed since the make-target-directory
appears on the wrong line. This causes races during the build process where you can
see failures like:

Assembler messages:
Fatal error: can't create [...]glibc/2.21-r0/build-x86_64-poky-linux-gnux32/time/gettimeofday.os: No such file or directory
Assembler messages:
Fatal error: can't create [...]glibc/2.21-r0/build-x86_64-poky-linux-gnux32/time/time.os: No such file or directory

The issue is that the carriage return is being escaped when it should
not be. The change to sysd-syscalls with this change:

before:

"""
$(foreach p,$(sysd-rules-targets),$(objpfx)$(patsubst %,$p,time).os): \
                $(..)sysdeps/unix/make-syscalls.sh      $(make-target-directory)
        (echo '#include <dl-vdso.h>';
"""

after:

"""
$(foreach p,$(sysd-rules-targets),$(objpfx)$(patsubst %,$p,time).os): \
                $(..)sysdeps/unix/make-syscalls.sh
        $(make-target-directory)
        (echo '#include <dl-vdso.h>';
"""

which ensures the target directory is correctly created. Only x32 uses the vdso
code which contains the bug which is why the error only really appears on x32.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-core/glibc/glibc/makesyscall.patch b/meta/recipes-core/glibc/glibc/makesyscall.patch
new file mode 100644
index 0000000..9afb75e
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/makesyscall.patch
@@ -0,0 +1,48 @@
+On x32 builds, sysd-syscalls appears malformed since the make-target-directory
+appears on the wrong line. This causes races during the build process where you can
+see failures like:
+
+Assembler messages:
+Fatal error: can't create [...]glibc/2.21-r0/build-x86_64-poky-linux-gnux32/time/gettimeofday.os: No such file or directory
+Assembler messages:
+Fatal error: can't create [...]glibc/2.21-r0/build-x86_64-poky-linux-gnux32/time/time.os: No such file or directory
+
+The isue is that the carridge return is being escaped when it should 
+not be. The change to sysd-syscalls with this change:
+
+before:
+
+"""
+$(foreach p,$(sysd-rules-targets),$(objpfx)$(patsubst %,$p,time).os): \
+                $(..)sysdeps/unix/make-syscalls.sh      $(make-target-directory)
+        (echo '#include <dl-vdso.h>'; 
+"""
+
+after:
+
+"""
+$(foreach p,$(sysd-rules-targets),$(objpfx)$(patsubst %,$p,time).os): \
+                $(..)sysdeps/unix/make-syscalls.sh
+        $(make-target-directory)
+        (echo '#include <dl-vdso.h>'; 
+"""
+
+which ensures the target directory is correctly created. Only x32 uses the vdso 
+code which contains the bug which is why the error only really appears on x32.
+
+Upstream-Status: Pending
+RP 2015/5/13
+
+Index: git/sysdeps/unix/make-syscalls.sh
+===================================================================
+--- git.orig/sysdeps/unix/make-syscalls.sh
++++ git/sysdeps/unix/make-syscalls.sh
+@@ -278,7 +278,7 @@ while read file srcfile caller syscall a
+     vdso_symver=`echo "$vdso_symver" | sed 's/\./_/g'`
+     echo "\
+ \$(foreach p,\$(sysd-rules-targets),\$(objpfx)\$(patsubst %,\$p,$file).os): \\
+-		\$(..)sysdeps/unix/make-syscalls.sh\
++		\$(..)sysdeps/unix/make-syscalls.sh
+ 	\$(make-target-directory)
+ 	(echo '#include <dl-vdso.h>'; \\
+ 	 echo 'extern void *${strong}_ifunc (void) __asm (\"${strong}\");'; \\
diff --git a/meta/recipes-core/glibc/glibc_2.21.bb b/meta/recipes-core/glibc/glibc_2.21.bb
index 58a9601..ac8e8f8 100644
--- a/meta/recipes-core/glibc/glibc_2.21.bb
+++ b/meta/recipes-core/glibc/glibc_2.21.bb
@@ -26,6 +26,7 @@ SRC_URI = "git://sourceware.org/git/glibc.git;branch=${BRANCH} \
            file://0001-When-disabling-SSE-also-make-sure-that-fpmath-is-not.patch \
            file://0001-yes-within-the-path-sets-wrong-config-variables.patch \
            file://elf-Makefile-fix-a-typo.patch \
+           file://makesyscall.patch \
            ${EGLIBCPATCHES} \
           "
 EGLIBCPATCHES = "\



