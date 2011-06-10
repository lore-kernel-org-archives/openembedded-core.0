Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QV2FF-0005ag-1d for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 15:59:29 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QV2C2-0000Hy-I3
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 15:56:10 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Organization: Phil Blundell Consulting Ltd
Date: Fri, 10 Jun 2011 14:56:09 +0100
Message-ID: <1307714169.25285.6.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH v2] uclibc: fix compile error on i586
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
X-List-Received-Date: Fri, 10 Jun 2011 13:59:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Without this you get:

| libc/sysdeps/linux/common/epoll.c: In function '__libc_epoll_pwait':
| libc/sysdeps/linux/common/epoll.c:71:80: error: memory input 7 is not directly addressable
| libc/sysdeps/linux/common/epoll.c:75:86: error: memory input 7 is not directly addressable
| make: *** [libc/sysdeps/linux/common/epoll.o] Error 1

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 .../uclibc/uclibc-git/epoll-asm-fix.patch          |   25 ++++++++++++++++++++
 meta/recipes-core/uclibc/uclibc_git.bb             |    1 +
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
diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index c1bc422..a2c6ee5 100644
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
1.7.2.5





