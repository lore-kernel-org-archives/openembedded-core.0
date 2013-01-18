Received: from afflict.kos.to ([92.243.29.197])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <riku.voipio@linaro.org>) id 1TwD4Y-0007YU-5S
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 15:37:50 +0100
Received: from aimless.elisa-laajakaista.fi
	(a91-156-58-157.elisa-laajakaista.fi [91.156.58.157])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by afflict.kos.to (Postfix) with ESMTPSA id 3B943264C0;
	Fri, 18 Jan 2013 15:13:29 +0100 (CET)
From: Riku Voipio <riku.voipio@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Jan 2013 16:13:22 +0200
Message-Id: <1358518403-11155-2-git-send-email-riku.voipio@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1358518403-11155-1-git-send-email-riku.voipio@linaro.org>
References: <1358518403-11155-1-git-send-email-riku.voipio@linaro.org>
Subject: [PATCH 2/3] attr: convert to generic syscall numbers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Jan 2013 14:37:54 -0000

xattr system calls are old enough that we can switch
to just pulling the system call numbers from kernel
headers.

Upstream-Status: Submitted acl-devel@nongnu.org

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 meta/recipes-support/attr/attr.inc                 |    4 +-
 .../attr/files/generic-syscalls.patch              |  187 ++++++++++++++++++++
 2 files changed, 190 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/attr/files/generic-syscalls.patch

diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index 6deb004..eaed7af 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=2d0aa14b3fce4694e4f615e30186335f \
                     file://attr/attr.c;endline=17;md5=be0403261f0847e5f43ed5b08d19593c \
                     file://libattr/libattr.c;endline=17;md5=7970f77049f8fa1199fff62a7ab724fb"
 
-SRC_URI = "http://download.savannah.gnu.org/releases/attr/${BP}.src.tar.gz"
+SRC_URI = "http://download.savannah.gnu.org/releases/attr/${BP}.src.tar.gz \
+           file://generic-syscalls.patch \
+           "
 
 require ea-acl.inc
 
diff --git a/meta/recipes-support/attr/files/generic-syscalls.patch b/meta/recipes-support/attr/files/generic-syscalls.patch
new file mode 100644
index 0000000..3a35e02
--- /dev/null
+++ b/meta/recipes-support/attr/files/generic-syscalls.patch
@@ -0,0 +1,187 @@
+Remove arch specific syscall numbers
+
+xattr system calls are old enough that we can switch
+to just pulling the system call numbers from kernel
+headers.
+
+Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
+
+Upstream-Status: Submitted acl-devel@nongnu.org
+
+--- a/libattr/syscalls.c
++++ b/libattr/syscalls.c
+@@ -23,172 +23,10 @@
+ 
+ #include <errno.h>
+ #include <unistd.h>
++#include <sys/syscall.h>
+ 
+-#if defined (__i386__)
++#if defined (__NR_setxattr)
+ # define HAVE_XATTR_SYSCALLS 1
+-# define __NR_setxattr		226
+-# define __NR_lsetxattr		227
+-# define __NR_fsetxattr		228
+-# define __NR_getxattr		229
+-# define __NR_lgetxattr		230
+-# define __NR_fgetxattr		231
+-# define __NR_listxattr		232
+-# define __NR_llistxattr	233
+-# define __NR_flistxattr	234
+-# define __NR_removexattr	235
+-# define __NR_lremovexattr	236
+-# define __NR_fremovexattr	237
+-#elif defined (__sparc__)
+-# define HAVE_XATTR_SYSCALLS 1
+-# define __NR_setxattr		169
+-# define __NR_lsetxattr		170
+-# define __NR_fsetxattr		171
+-# define __NR_getxattr		172
+-# define __NR_lgetxattr		173
+-# define __NR_fgetxattr		177
+-# define __NR_listxattr		178
+-# define __NR_llistxattr	179
+-# define __NR_flistxattr	180
+-# define __NR_removexattr	181
+-# define __NR_lremovexattr	182
+-# define __NR_fremovexattr	186
+-#elif defined (__ia64__)
+-# define HAVE_XATTR_SYSCALLS 1
+-# define __NR_setxattr		1217
+-# define __NR_lsetxattr		1218
+-# define __NR_fsetxattr		1219
+-# define __NR_getxattr		1220
+-# define __NR_lgetxattr		1221
+-# define __NR_fgetxattr		1222
+-# define __NR_listxattr		1223
+-# define __NR_llistxattr	1224
+-# define __NR_flistxattr	1225
+-# define __NR_removexattr	1226
+-# define __NR_lremovexattr	1227
+-# define __NR_fremovexattr	1228
+-#elif defined (__powerpc__)
+-# define HAVE_XATTR_SYSCALLS 1
+-# define __NR_setxattr		209
+-# define __NR_lsetxattr		210
+-# define __NR_fsetxattr		211
+-# define __NR_getxattr		212
+-# define __NR_lgetxattr		213
+-# define __NR_fgetxattr		214
+-# define __NR_listxattr		215
+-# define __NR_llistxattr	216
+-# define __NR_flistxattr	217
+-# define __NR_removexattr	218
+-# define __NR_lremovexattr	219
+-# define __NR_fremovexattr	220
+-#elif defined (__x86_64__)
+-# define HAVE_XATTR_SYSCALLS 1
+-# define __NR_setxattr		188
+-# define __NR_lsetxattr		189
+-# define __NR_fsetxattr		190
+-# define __NR_getxattr		191
+-# define __NR_lgetxattr		192
+-# define __NR_fgetxattr		193
+-# define __NR_listxattr		194
+-# define __NR_llistxattr	195
+-# define __NR_flistxattr	196
+-# define __NR_removexattr	197
+-# define __NR_lremovexattr	198
+-# define __NR_fremovexattr	199
+-#elif defined (__s390__)
+-# define HAVE_XATTR_SYSCALLS 1
+-# define __NR_setxattr		224
+-# define __NR_lsetxattr		225
+-# define __NR_fsetxattr		226
+-# define __NR_getxattr		227
+-# define __NR_lgetxattr		228
+-# define __NR_fgetxattr		229
+-# define __NR_listxattr		230
+-# define __NR_llistxattr	231
+-# define __NR_flistxattr	232
+-# define __NR_removexattr	233
+-# define __NR_lremovexattr	234
+-# define __NR_fremovexattr	235
+-#elif defined (__arm__)
+-# define HAVE_XATTR_SYSCALLS 1
+-# if defined(__ARM_EABI__) || defined(__thumb__)
+-#  define __NR_SYSCALL_BASE 0
+-# else
+-#  define __NR_SYSCALL_BASE 0x900000
+-# endif
+-# define __NR_setxattr		(__NR_SYSCALL_BASE+226)
+-# define __NR_lsetxattr		(__NR_SYSCALL_BASE+227)
+-# define __NR_fsetxattr		(__NR_SYSCALL_BASE+228)
+-# define __NR_getxattr		(__NR_SYSCALL_BASE+229)
+-# define __NR_lgetxattr		(__NR_SYSCALL_BASE+230)
+-# define __NR_fgetxattr		(__NR_SYSCALL_BASE+231)
+-# define __NR_listxattr		(__NR_SYSCALL_BASE+232)
+-# define __NR_llistxattr	(__NR_SYSCALL_BASE+233)
+-# define __NR_flistxattr	(__NR_SYSCALL_BASE+234)
+-# define __NR_removexattr	(__NR_SYSCALL_BASE+235)
+-# define __NR_lremovexattr	(__NR_SYSCALL_BASE+236)
+-# define __NR_fremovexattr	(__NR_SYSCALL_BASE+237)
+-#elif defined (__mips64)
+-# define HAVE_XATTR_SYSCALLS 1
+-# ifdef __LP64__ /* mips64 using n64 ABI */
+-#  define __NR_Linux 5000
+-# else /* mips64 using n32 ABI */
+-#  define __NR_Linux 6000
+-# endif
+-# define __NR_setxattr		(__NR_Linux + 180)
+-# define __NR_lsetxattr		(__NR_Linux + 181)
+-# define __NR_fsetxattr		(__NR_Linux + 182)
+-# define __NR_getxattr		(__NR_Linux + 183)
+-# define __NR_lgetxattr		(__NR_Linux + 184)
+-# define __NR_fgetxattr		(__NR_Linux + 185)
+-# define __NR_listxattr		(__NR_Linux + 186)
+-# define __NR_llistxattr	(__NR_Linux + 187)
+-# define __NR_flistxattr	(__NR_Linux + 188)
+-# define __NR_removexattr	(__NR_Linux + 189)
+-# define __NR_lremovexattr	(__NR_Linux + 190)
+-# define __NR_fremovexattr	(__NR_Linux + 191)
+-#elif defined (__mips__) /* mips32, or mips64 using o32 ABI */
+-# define HAVE_XATTR_SYSCALLS 1
+-# define __NR_Linux 4000
+-# define __NR_setxattr		(__NR_Linux + 224)
+-# define __NR_lsetxattr		(__NR_Linux + 225)
+-# define __NR_fsetxattr		(__NR_Linux + 226)
+-# define __NR_getxattr		(__NR_Linux + 227)
+-# define __NR_lgetxattr		(__NR_Linux + 228)
+-# define __NR_fgetxattr		(__NR_Linux + 229)
+-# define __NR_listxattr		(__NR_Linux + 230)
+-# define __NR_llistxattr	(__NR_Linux + 231)
+-# define __NR_flistxattr	(__NR_Linux + 232)
+-# define __NR_removexattr	(__NR_Linux + 233)
+-# define __NR_lremovexattr	(__NR_Linux + 234)
+-# define __NR_fremovexattr	(__NR_Linux + 235)
+-#elif defined (__alpha__)
+-# define HAVE_XATTR_SYSCALLS 1
+-# define __NR_setxattr		382
+-# define __NR_lsetxattr		383
+-# define __NR_fsetxattr		384
+-# define __NR_getxattr		385
+-# define __NR_lgetxattr		386
+-# define __NR_fgetxattr		387
+-# define __NR_listxattr		388
+-# define __NR_llistxattr	389
+-# define __NR_flistxattr	390
+-# define __NR_removexattr	391
+-# define __NR_lremovexattr	392
+-# define __NR_fremovexattr	393
+-#elif defined (__mc68000__)
+-# define HAVE_XATTR_SYSCALLS 1
+-# define __NR_setxattr		223
+-# define __NR_lsetxattr		224
+-# define __NR_fsetxattr		225
+-# define __NR_getxattr		226
+-# define __NR_lgetxattr		227
+-# define __NR_fgetxattr		228
+-# define __NR_listxattr		229
+-# define __NR_llistxattr	230
+-# define __NR_flistxattr	231
+-# define __NR_removexattr	232
+-# define __NR_lremovexattr	233
+-# define __NR_fremovexattr	234
+ #else
+ # warning "Extended attribute syscalls undefined for this architecture"
+ # define HAVE_XATTR_SYSCALLS 0
-- 
1.7.10.4



