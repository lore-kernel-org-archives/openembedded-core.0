Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 842D260034
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 09:01:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="91867163"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 May 2015 16:57:19 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t488xspc014484
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 May 2015 16:59:54 +0800
Received: from localhost.localdomain (10.167.226.25) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 8 May 2015 17:01:14 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 8 May 2015 17:01:14 +0800
Message-ID: <1431075674-1688-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.25]
Subject: [PATCH] glibc_2.21.bb: Fix LSB bugs #3033
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
X-List-Received-Date: Fri, 08 May 2015 09:01:19 -0000
Content-Type: text/plain

Bug 3033 - T.c_iflag and T.tcgetattr fail when using pseudo ttys (on some systems).
https://lsbbugs.linuxfoundation.org/show_bug.cgi?id=3033

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../glibc/glibc/tcsetattr.c-Fix-LSB-NG-Cases.patch | 69 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.21.bb              |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/tcsetattr.c-Fix-LSB-NG-Cases.patch

diff --git a/meta/recipes-core/glibc/glibc/tcsetattr.c-Fix-LSB-NG-Cases.patch b/meta/recipes-core/glibc/glibc/tcsetattr.c-Fix-LSB-NG-Cases.patch
new file mode 100644
index 0000000..df0e61d
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/tcsetattr.c-Fix-LSB-NG-Cases.patch
@@ -0,0 +1,69 @@
+From 9022ee975265b65f59782ea92b59eccc95774a88 Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Fri, 8 May 2015 13:51:30 +0900
+Subject: [PATCH] tcsetattr.c: Fix LSB NG Cases
+
+/tset/POSIX.os/devclass/tcgetattr/T.tcgetattr 1 2
+/tset/POSIX.os/devclass/c_iflag/T.c_iflag 6 7 8 9
+
+This patch is from Fedora.
+
+Upstream-Status: pending.
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ sysdeps/unix/sysv/linux/tcsetattr.c | 32 +++++++++++++++++++++++++++++++-
+ 1 file changed, 31 insertions(+), 1 deletion(-)
+
+diff --git a/sysdeps/unix/sysv/linux/tcsetattr.c b/sysdeps/unix/sysv/linux/tcsetattr.c
+index d7afc63..7cb2c61 100644
+--- a/sysdeps/unix/sysv/linux/tcsetattr.c
++++ b/sysdeps/unix/sysv/linux/tcsetattr.c
+@@ -48,6 +48,7 @@ tcsetattr (fd, optional_actions, termios_p)
+ {
+   struct __kernel_termios k_termios;
+   unsigned long int cmd;
++  int retval;
+ 
+   switch (optional_actions)
+     {
+@@ -79,6 +80,35 @@ tcsetattr (fd, optional_actions, termios_p)
+   memcpy (&k_termios.c_cc[0], &termios_p->c_cc[0],
+ 	  __KERNEL_NCCS * sizeof (cc_t));
+ 
+-  return INLINE_SYSCALL (ioctl, 3, fd, cmd, &k_termios);
++  retval = INLINE_SYSCALL (ioctl, 3, fd, cmd, &k_termios);
++
++  if (retval == 0 && cmd == TCSETS)
++    {
++      /* The Linux kernel has a bug which silently ignore the invalid
++        c_cflag on pty. We have to check it here. */
++      int save = errno;
++      retval = INLINE_SYSCALL (ioctl, 3, fd, TCGETS, &k_termios);
++      if (retval)
++       {
++         /* We cannot verify if the setting is ok. We don't return
++            an error (?). */
++         __set_errno (save);
++         retval = 0;
++       }
++      else if ((termios_p->c_cflag & (PARENB | CREAD))
++              != (k_termios.c_cflag & (PARENB | CREAD))
++              || ((termios_p->c_cflag & CSIZE)
++                  && ((termios_p->c_cflag & CSIZE)
++                      != (k_termios.c_cflag & CSIZE))))
++       {
++         /* It looks like the Linux kernel silently changed the
++            PARENB/CREAD/CSIZE bits in c_cflag. Report it as an
++            error. */
++         __set_errno (EINVAL);
++         retval = -1;
++       }
++    }
++
++  return retval;
+ }
+ libc_hidden_def (tcsetattr)
+-- 
+1.8.4.2
+
diff --git a/meta/recipes-core/glibc/glibc_2.21.bb b/meta/recipes-core/glibc/glibc_2.21.bb
index 58a9601..a061b08 100644
--- a/meta/recipes-core/glibc/glibc_2.21.bb
+++ b/meta/recipes-core/glibc/glibc_2.21.bb
@@ -27,6 +27,7 @@ SRC_URI = "git://sourceware.org/git/glibc.git;branch=${BRANCH} \
            file://0001-yes-within-the-path-sets-wrong-config-variables.patch \
            file://elf-Makefile-fix-a-typo.patch \
            ${EGLIBCPATCHES} \
+           file://tcsetattr.c-Fix-LSB-NG-Cases.patch \
           "
 EGLIBCPATCHES = "\
            file://timezone-re-written-tzselect-as-posix-sh.patch \
-- 
1.8.4.2


