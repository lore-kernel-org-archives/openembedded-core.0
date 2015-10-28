Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7820F75E80
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Oct 2015 06:41:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9S6fIuZ013436
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 23:41:18 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 27 Oct 2015 23:41:17 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Oct 2015 14:41:16 +0800
Message-ID: <77690b5c7cf4202599eafda90761a0e32cb464f7.1446013329.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1446013329.git.Qi.Chen@windriver.com>
References: <cover.1446013329.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] rsync:Use usleep() for msleep() if it is available
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
X-List-Received-Date: Wed, 28 Oct 2015 06:41:21 -0000
Content-Type: text/plain

Use usleep() for msleep() if it is available.

Upstreamlink:https://git.samba.org/?p=rsync.git;a=
commitdiff;h=5546dab32970955e77ef7a5886bcd8fb765a25bf

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...rsync-use-usleep-for-msleep-when-possible.patch | 55 ++++++++++++++++++++++
 meta/recipes-devtools/rsync/rsync.inc              |  3 +-
 2 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/rsync/files/0001-rsync-use-usleep-for-msleep-when-possible.patch

diff --git a/meta/recipes-devtools/rsync/files/0001-rsync-use-usleep-for-msleep-when-possible.patch b/meta/recipes-devtools/rsync/files/0001-rsync-use-usleep-for-msleep-when-possible.patch
new file mode 100644
index 0000000..ad54add
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/0001-rsync-use-usleep-for-msleep-when-possible.patch
@@ -0,0 +1,55 @@
+Upstream-Status: Pending
+
+Subject: rsync: use usleep() for msleep() when possible
+
+This patch refers to https://git.samba.org/?p=rsync.git;a=commitdiff;h=5546dab32970955e77ef7a5886bcd8fb765a25b
+
+Signed-off-by: Hu Yadi <Yadi.Hu@windriver.com>
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ configure.ac | 2 +-
+ util2.c      | 7 ++++++-
+ 2 files changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index cf588ce..12e0dba 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -602,7 +602,7 @@ AC_CHECK_FUNCS(waitpid wait4 getcwd strdup chown chmod lchmod mknod mkfifo \
+     setlocale setmode open64 lseek64 mkstemp64 mtrace va_copy __va_copy \
+     seteuid strerror putenv iconv_open locale_charset nl_langinfo getxattr \
+     extattr_get_link sigaction sigprocmask setattrlist getgrouplist \
+-    initgroups utimensat posix_fallocate attropen setvbuf)
++    initgroups utimensat posix_fallocate attropen setvbuf usleep)
+ 
+ dnl cygwin iconv.h defines iconv_open as libiconv_open
+ if test x"$ac_cv_func_iconv_open" != x"yes"; then
+diff --git a/util2.c b/util2.c
+index 6ffbcec..73cb736 100644
+--- a/util2.c
++++ b/util2.c
+@@ -35,6 +35,9 @@ extern int checksum_len;
+  **/
+ int msleep(int t)
+ {
++#ifdef HAVE_USLEEP
++	usleep(t*1000);
++#else
+ 	int tdiff = 0;
+ 	struct timeval tval, t1, t2;
+ 
+@@ -52,8 +55,10 @@ int msleep(int t)
+ 			t1 = t2; /* Time went backwards, so start over. */
+ 		tdiff = (t2.tv_sec - t1.tv_sec)*1000 +
+ 			(t2.tv_usec - t1.tv_usec)/1000;
++		if (tdiff < 0)
++			t1 = t2; /* Time went backwards, so start over. */
+ 	}
+-
++#endif
+ 	return True;
+ }
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/rsync/rsync.inc b/meta/recipes-devtools/rsync/rsync.inc
index c65f270..b250367 100644
--- a/meta/recipes-devtools/rsync/rsync.inc
+++ b/meta/recipes-devtools/rsync/rsync.inc
@@ -11,7 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "popt"
 
 SRC_URI = "http://rsync.samba.org/ftp/rsync/src/rsync-${PV}.tar.gz \
-           file://rsyncd.conf"
+           file://rsyncd.conf \
+           file://0001-rsync-use-usleep-for-msleep-when-possible.patch"
 
 inherit autotools
 
-- 
1.9.1


