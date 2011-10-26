Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <julian.pidancet@gmail.com>) id 1RJAUu-0007a1-CH
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Oct 2011 22:55:05 +0200
Received: by wyg19 with SMTP id 19so2257431wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2011 13:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=pXvFYYXCydRiCxHWIctClz1zlTyY42d0mnPA6j/DrHw=;
	b=kbVLNXT6DSYzMujgbvAXV+AcVKHrsNhgjdqqYNkgVcsiMJ07X+921Vn5OYetODQ7I9
	9Be23qe35jgYUOLV9xVAi8dnCJYvdRWkJdeR1S0pDI1SHzb9xaR+gCplrFFM55Y/iPs9
	M5N8yOkwWHa2q77bQ1GX7Xeqf8SnrRDDQ/lyg=
Received: by 10.227.208.71 with SMTP id gb7mr11870296wbb.7.1319662132202;
	Wed, 26 Oct 2011 13:48:52 -0700 (PDT)
Received: from localhost.localdomain (188-223-88-44.zone14.bethere.co.uk.
	[188.223.88.44])
	by mx.google.com with ESMTPS id gd18sm5340981wbb.5.2011.10.26.13.48.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Oct 2011 13:48:51 -0700 (PDT)
From: Julian Pidancet <julian.pidancet@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2011 22:41:23 +0100
Message-Id: <326c1a05ec310abcb0ec8363bcbe952c05fdf9fb.1319665176.git.julian.pidancet@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Cc: Julian Pidancet <julian.pidancet@gmail.com>
Subject: [PATCH v2] Give coreutils a chance to build the df utility
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
X-List-Received-Date: Wed, 26 Oct 2011 20:55:05 -0000

The coreutils configure script is unable determine how to get free
space from the Operating System when cross-compiling.
This changes caches the result of the "statfs2_bsize" test for the
coreutils configure script.
Both glibc and uclibc defines statfs as a two-argument function
and uses a struct statfs containing a f_bsize field. That's why
the fu_cv_sys_stat_statfs2_bsize variable has to be defined for
both libcs.

Signed-off-by: Julian Pidancet <julian.pidancet@gmail.com>
---
 meta/recipes-core/coreutils/coreutils_8.14.bb |    2 +-
 meta/site/common-glibc                        |    3 +++
 meta/site/common-uclibc                       |    3 +++
 3 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.14.bb b/meta/recipes-core/coreutils/coreutils_8.14.bb
index f3b7af7..fa2a2c9 100644
--- a/meta/recipes-core/coreutils/coreutils_8.14.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.14.bb
@@ -27,7 +27,7 @@ bindir_progs = "base64 basename chcon cksum comm csplit cut dir dircolors dirnam
                 join link logname md5sum mkfifo mktemp nice nl nohup nproc od paste pathchk \
                 pinky pr printenv printf ptx readlink runcon seq sha1sum sha224sum sha256sum \
                 sha384sum sha512sum shred shuf sort split stat stdbuf sum tac tail tee test timeout\
-                tr truncate tsort tty unexpand uniq unlink uptime users vdir wc who whoami yes"
+                tr truncate tsort tty unexpand uniq unlink uptime users vdir wc who whoami yes df"
 
 # hostname gets a special treatment and is not included in this
 base_bindir_progs = "cat chgrp chmod chown cp date dd echo false kill ln ls mkdir \
diff --git a/meta/site/common-glibc b/meta/site/common-glibc
index 9b74038..364ab67 100644
--- a/meta/site/common-glibc
+++ b/meta/site/common-glibc
@@ -25,6 +25,9 @@ clamav_av_have_in_port_t=${clamav_av_have_in_port_t=yes}
 clamav_av_have_in_addr_t=${clamav_av_have_in_addr_t=yes}
 ac_cv_func_mmap_fixed_mapped=${ac_cv_func_mmap_fixed_mapped=yes}
 
+# coreutils
+fu_cv_sys_stat_statfs2_bsize=${fu_cv_sys_stat_statfs2_bsize=yes}
+
 # glib
 glib_cv_strlcpy=${glib_cv_strlcpy=no}
 ac_cv_func_printf_unix98=${ac_cv_func_printf_unix98=yes}
diff --git a/meta/site/common-uclibc b/meta/site/common-uclibc
index bdad0e9..a264765 100644
--- a/meta/site/common-uclibc
+++ b/meta/site/common-uclibc
@@ -28,6 +28,9 @@ ac_cv_have_abstract_sockets=${ac_cv_have_abstract_sockets=yes}
 bash_cv_under_sys_siglist=${bash_cv_under_sys_siglist=no}
 bash_cv_sys_siglist=${bash_cv_sys_siglist=no}
 
+# coreutils
+fu_cv_sys_stat_statfs2_bsize=${fu_cv_sys_stat_statfs2_bsize=yes}
+
 # va_copy and _va_copy
 ac_cv_va_copy=${ac_cv_va_copy=yes}
 ac_cv___va_copy=${ac_cv___va_copy=yes}
-- 
Julian Pidancet



