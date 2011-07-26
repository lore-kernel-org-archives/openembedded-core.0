Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QlpHE-0007Hr-3h
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 23:34:56 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6QLUgBv028063
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 14:30:42 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 26 Jul 2011 14:30:41 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Jul 2011 16:31:07 -0500
Message-ID: <1f90f46b36c78fd39b1fc309098415833322aadd.1311715727.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311715727.git.mark.hatle@windriver.com>
References: <cover.1311715727.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [v2 PATCH 6/8] eglibc_2.13: Resolve multilib header conflicts
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
X-List-Received-Date: Tue, 26 Jul 2011 21:34:56 -0000
Content-Type: text/plain

Due to mismatches between various header definitions in i386 and x86_64
we need to overwrite the i386 versions of the headers with their x86_64
equivalents.

This can not be done for the syscall.h as it's dynamically generated,
so use the header conflict resolution helper for that.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-core/eglibc/eglibc-package.inc |    4 +-
 meta/recipes-core/eglibc/eglibc_2.13.bb     |   91 +++++++++++++++++++++++++++
 2 files changed, 94 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 9e71150..a995f4f 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -86,10 +86,12 @@ SUMMARY_eglibc-utils = "Miscellaneous utilities provided by eglibc"
 DESCRIPTION_eglibc-utils = "Miscellaneous utilities including getconf, iconf, locale, gencat, tzselect, zic, rpcinfo, ..."
 DESCRIPTION_libsotruss = "Library to support sotruss which traces calls through PLTs"
 
-inherit libc-common
+inherit libc-common multilib_header
 
 do_install_append () {
 	rm -f ${D}${sysconfdir}/localtime
+
+	oe_multilib_header bits/syscall.h
 }
 
 do_install_locale () {
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index 6076ab9..f88a071 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -80,6 +80,97 @@ do_move_ports() {
 	fi
 }
 
+do_patch_append() {
+	bb.build.exec_func('do_fix_ia_headers', d)
+}
+
+# We need to ensure that all of the i386 and x86_64 headers are identical
+# to support the multilib case.  We do this by copying headers from x86_64
+# to i386 directories.  Normally when hand building eglibc or a combined
+# system you would build 32-bit, and then overwrite any files with the x86_64
+# versions.
+#
+# Each time eglibc is updated, this will need to be re-evaluated.  In order
+# to do this, disable this function.  Build eglibc for a 32-bit and a 64-bit
+# IA32 target.  Compare the contents of the include files -- comments specific
+# to the x86_64 version compared to the 32-bit one.
+#
+# For eglibc 2.13, each conflict noted below:
+#  bits/a.out.h - Add support for __WORDSIZE = 64
+#  bits/byteswap.h - Copyright date mismatch, add support for __WORDSIZE = 64
+#  bits/endian.h - Comment mismatch
+#  bits/environment.h - add support for __WORDSIZE = 64
+#  bits/fcntl.h - Comment/Copyright date mismatch, add support for __WORDSIZE = 64
+#  bits/fenv.h - Copyright date mismatch, add support for __WORDSIZE = 64
+#  bits/huge_vall.h - Comment/Copyright date mismatch, remove support for older gcc
+#  bits/link.h - Function name difference, add x86_64 definitions
+#  bits/mathdef.h - Copyright date mismatch, add support for __WORDSIZE = 64
+#  bits/mathinline.h - Copyright date mismatch, contributed by mismatch, remove support for older gcc/assembly optimization, add support for __WORDSIZE = 64
+#  bits/mman.h - Header/Copyright date mismatch, add MAP_32BIT definition
+#  bits/msq.h - Copyright date mismatch, add __WORDSIZE = 32 definitions
+#  bits/pthread_type.h -- Contributed by added, add support for __WORDSIZE = 64
+#  bits/select.h - Copyright date mismatch, add support for __WORDSIZE = 64
+#  bits/semaphore.h - Copyright date mismatch, add support for __WORDSIZE = 64
+#  bits/sem.h - Copyright date mismatch
+#  bits/setjmp.h - Copyrgiht date mismatch, add support for __WORDSIZE = 64
+#  bits/shm.h - Copyright date mismatch, add support for __WORDSIZE = 32
+#  bits/sigcontext.h - Copyright date mismatch, license wording mismatch, add support for __WORDSIZE = 32
+#  bits/stat.h - Copyright date mismatch, add support for __WORDSIZE = 32 and __WORDSIZE = 64
+#  bits/string.h - Header/Copyright date mismatch, remove assembly optimizations
+#  bits/syscall.h - different order, some different syscalls listed
+#  bits/wchar.h - Change the way the definitions are done
+#  bits/wordsize.h - Different header, remove license notice, add __x86_64__ support
+#  bits/xtitypes.h - Header difference, different typedef format
+#  bits/fpu_control.h - header difference, revised comments, updated assembly macros
+#  sys/debugreg.h - Copyright date mismatch, new definition and added __WORDSIZE=64 support
+#  sys/epoll.h - Copyright date mismatch, slightly different definitions
+#  sys/io.h - Copyright date mismatch, slightly different assembly formats
+#  sys/perm.h - Copyright date mismatch
+#  sys/procfs.h - Copyright date mismatch, support for __WORDSIZE = 32
+#  sys/reg.h - Copyright date mismatch, support for __WORDSIZE = 64
+#  sys/ucontext.h - Copyright date mismatch, support for __WORDSIZE = 64
+#  sys/user.h - Copyright date mismatch, support for __WORDSIZE = 64
+#
+# we rm something to return to the default version
+#
+do_fix_ia_headers() {
+	cp ${S}/sysdeps/unix/sysv/linux/x86_64/bits/a.out.h ${S}/sysdeps/unix/sysv/linux/i386/bits/a.out.h
+	cp ${S}/sysdeps/x86_64/bits/byteswap.h ${S}/sysdeps/i386/bits/byteswap.h
+	cp ${S}/sysdeps/x86_64/bits/endian.h ${S}/sysdeps/i386/bits/endian.h
+	cp ${S}/sysdeps/unix/sysv/linux/x86_64/bits/environments.h ${S}/sysdeps/unix/sysv/linux/i386/bits/environments.h
+	cp ${S}/sysdeps/unix/sysv/linux/x86_64/bits/fcntl.h ${S}/sysdeps/unix/sysv/linux/i386/bits/fcntl.h
+	cp ${S}/sysdeps/x86_64/fpu/bits/fenv.h ${S}/sysdeps/i386/fpu/bits/fenv.h
+	rm ${S}/sysdeps/i386/bits/huge_vall.h
+	cp ${S}/sysdeps/x86_64/bits/link.h ${S}/sysdeps/i386/bits/link.h
+	cp ${S}/sysdeps/x86_64/bits/mathdef.h ${S}/sysdeps/i386/bits/mathdef.h
+	cp ${S}/sysdeps/x86_64/fpu/bits/mathinline.h ${S}/sysdeps/i386/fpu/bits/mathinline.h
+	cp ${S}/sysdeps/unix/sysv/linux/x86_64/bits/mman.h ${S}/sysdeps/unix/sysv/linux/i386/bits/mman.h
+	cp ${S}/sysdeps/unix/sysv/linux/x86_64/bits/msq.h ${S}/sysdeps/unix/sysv/linux/i386/bits/msq.h
+	cp ${S}/nptl/sysdeps/unix/sysv/linux/x86_64/bits/pthreadtypes.h ${S}/nptl/sysdeps/unix/sysv/linux/i386/bits/pthreadtypes.h
+	cp ${S}/sysdeps/x86_64/bits/select.h ${S}/sysdeps/i386/bits/select.h
+	cp ${S}/nptl/sysdeps/unix/sysv/linux/x86_64/bits/semaphore.h ${S}/nptl/sysdeps/unix/sysv/linux/i386/bits/semaphore.h
+	rm ${S}/sysdeps/unix/sysv/linux/x86_64/bits/sem.h
+	cp ${S}/sysdeps/x86_64/bits/setjmp.h ${S}/sysdeps/i386/bits/setjmp.h
+	cp ${S}/sysdeps/unix/sysv/linux/x86_64/bits/shm.h ${S}/sysdeps/unix/sysv/linux/i386/bits/shm.h
+	cp ${S}/sysdeps/unix/sysv/linux/x86_64/bits/sigcontext.h ${S}/sysdeps/unix/sysv/linux/i386/bits/sigcontext.h
+	cp ${S}/sysdeps/unix/sysv/linux/x86_64/bits/stat.h ${S}/sysdeps/unix/sysv/linux/i386/bits/stat.h
+	rm ${S}/sysdeps/i386/i486/bits/string.h ; cp ${S}/sysdeps/x86_64/bits/string.h ${S}/sysdeps/i386/bits/string.h
+	# Skip syscall.h, see do_install
+	rm ${S}/sysdeps/unix/sysv/linux/i386/bits/wchar.h
+	cp ${S}/sysdeps/x86_64/bits/wordsize.h ${S}/sysdeps/i386/bits/wordsize.h
+	cp ${S}/sysdeps/x86_64/bits/xtitypes.h ${S}/sysdeps/i386/bits/xtitypes.h
+	# i386 version is correct, x86_64 is incorrect for fpu_control.h
+	cp ${S}/sysdeps/i386/fpu_control.h ${S}/sysdeps/x86_64/fpu_control.h
+	cp ${S}/sysdeps/unix/sysv/linux/x86_64/sys/debugreg.h ${S}/sysdeps/unix/sysv/linux/i386/sys/debugreg.h
+	cp ${S}/sysdeps/unix/sysv/linux/x86_64/sys/epoll.h ${S}/sysdeps/unix/sysv/linux/i386/sys/epoll.h
+	cp ${S}/sysdeps/unix/sysv/linux/x86_64/sys/io.h ${S}/sysdeps/unix/sysv/linux/i386/sys/io.h
+	cp ${S}/sysdeps/unix/sysv/linux/x86_64/sys/perm.h ${S}/sysdeps/unix/sysv/linux/i386/sys/perm.h
+	cp ${S}/sysdeps/unix/sysv/linux/x86_64/sys/procfs.h ${S}/sysdeps/unix/sysv/linux/i386/sys/procfs.h
+	cp ${S}/sysdeps/unix/sysv/linux/x86_64/sys/reg.h ${S}/sysdeps/unix/sysv/linux/i386/sys/reg.h
+	cp ${S}/sysdeps/unix/sysv/linux/x86_64/sys/ucontext.h ${S}/sysdeps/unix/sysv/linux/i386/sys/ucontext.h
+	cp ${S}/sysdeps/unix/sysv/linux/x86_64/sys/user.h ${S}/sysdeps/unix/sysv/linux/i386/sys/user.h
+}
+
 do_configure () {
 # override this function to avoid the autoconf/automake/aclocal/autoheader
 # calls for now
-- 
1.7.3.4



