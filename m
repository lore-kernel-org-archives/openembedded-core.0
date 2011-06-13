Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QW162-0002Fx-Vw
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 08:58:03 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jun 2011 23:54:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,356,1304319600"; d="scan'208";a="17500600"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jun 2011 23:54:36 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Jun 2011 23:54:14 -0700
Message-Id: <29569d26e733a17214b8082d51e4ed5205367baf.1307947593.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307947593.git.sgw@linux.intel.com>
References: <cover.1307947593.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307947593.git.sgw@linux.intel.com>
References: <cover.1307947593.git.sgw@linux.intel.com>
Cc: Phil Blundell <philb@gnu.org>
Subject: [*RFC CONSOLIDATED PULL RFC* 04/23] uclibc: fix compile error on i586
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
X-List-Received-Date: Mon, 13 Jun 2011 06:58:03 -0000

From: Phil Blundell <pb@pbcl.net>

Without this you get:

| libc/sysdeps/linux/common/epoll.c: In function '__libc_epoll_pwait':
| libc/sysdeps/linux/common/epoll.c:71:80: error: memory input 7 is not directly addressable
| libc/sysdeps/linux/common/epoll.c:75:86: error: memory input 7 is not directly addressable
| make: *** [libc/sysdeps/linux/common/epoll.o] Error 1

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 .../uclibc/uclibc-git/epoll-asm-fix.patch          |   25 ++++++++++++++++++++
 meta/recipes-core/uclibc/uclibc_git.bb             |    1 +
 2 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/epoll-asm-fix.patch

diff --git a/meta/recipes-core/uclibc/uclibc-git/epoll-asm-fix.patch b/meta/recipes-core/uclibc/uclibc-git/epoll-asm-fix.patch
new file mode 100644
index 0000000..bcd834d
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/epoll-asm-fix.patch
@@ -0,0 +1,25 @@
+Fix a compile error due to last argument to syscall() not being memory addressable.
+
+Upstream-Status: Pending
+Signed-off-by: Phil Blundell <philb@gnu.org>
+
+diff --git a/libc/sysdeps/linux/common/epoll.c b/libc/sysdeps/linux/common/epoll.c
+index 85b0cfd..c034b2c 100644
+--- a/libc/sysdeps/linux/common/epoll.c
++++ b/libc/sysdeps/linux/common/epoll.c
+@@ -67,12 +67,13 @@ extern __typeof(epoll_pwait) __libc_epoll_pwait;
+ int __libc_epoll_pwait(int epfd, struct epoll_event *events, int maxevents,
+ 						int timeout, const sigset_t *set)
+ {
++	int nsig = _NSIG / 8;
+ 	if (SINGLE_THREAD_P)
+-		return INLINE_SYSCALL(epoll_pwait, 6, epfd, events, maxevents, timeout, set, _NSIG / 8);
++		return INLINE_SYSCALL(epoll_pwait, 6, epfd, events, maxevents, timeout, set, nsig);
+ # ifdef __UCLIBC_HAS_THREADS_NATIVE__
+ 	else {
+ 		int oldtype = LIBC_CANCEL_ASYNC ();
+-		int result = INLINE_SYSCALL(epoll_pwait, 6, epfd, events, maxevents, timeout, set, _NSIG / 8);
++		int result = INLINE_SYSCALL(epoll_pwait, 6, epfd, events, maxevents, timeout, set, nsig);
+ 		LIBC_CANCEL_RESET (oldtype);
+ 		return result;
+ 	}
diff --git a/meta/recipes-core/uclibc/uclibc_git.bb b/meta/recipes-core/uclibc/uclibc_git.bb
index eded2fb..54babca 100644
--- a/meta/recipes-core/uclibc/uclibc_git.bb
+++ b/meta/recipes-core/uclibc/uclibc_git.bb
@@ -29,5 +29,6 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master;protocol=git \
 	file://remove_attribute_optimize_Os.patch \
 	file://append_UCLIBC_EXTRA_CFLAGS.patch \
 	file://compile-arm-fork-with-O2.patch \
+	file://epoll-asm-fix.patch \
 	"
 S = "${WORKDIR}/git"
-- 
1.7.3.4



