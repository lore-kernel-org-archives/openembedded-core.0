Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B918C607AD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 08:25:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="41649284"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Jun 2018 16:25:28 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 677944B41EE4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 16:25:20 +0800 (CST)
Received: from localhost.localdomain (10.167.226.122) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Fri, 29 Jun 2018 16:25:22 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Jun 2018 16:24:38 +0800
Message-ID: <20180629082438.16835-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
X-Originating-IP: [10.167.226.122]
X-yoursite-MailScanner-ID: 677944B41EE4.AC788
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [sumo][PATCH] procps:Fix-CVE-2018-1122&CVE-2018-1123
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
X-List-Received-Date: Fri, 29 Jun 2018 08:25:29 -0000
Content-Type: text/plain

Fix CVE-2018-1122 & CVE-2018-1122

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../procps/procps/CVE-2018-1122.patch              | 70 ++++++++++++++++++
 .../procps/procps/CVE-2018-1123.patch              | 84 ++++++++++++++++++++++
 meta/recipes-extended/procps/procps_3.3.12.bb      |  2 +
 3 files changed, 156 insertions(+)
 create mode 100644 meta/recipes-extended/procps/procps/CVE-2018-1122.patch
 create mode 100644 meta/recipes-extended/procps/procps/CVE-2018-1123.patch

diff --git a/meta/recipes-extended/procps/procps/CVE-2018-1122.patch b/meta/recipes-extended/procps/procps/CVE-2018-1122.patch
new file mode 100644
index 0000000..f840873
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/CVE-2018-1122.patch
@@ -0,0 +1,70 @@
+From 3cf9b0f403f758a2cfdc6f52f76c261b0f6ce924 Mon Sep 17 00:00:00 2001
+From: Qualys Security Advisory <qsa@qualys.com>
+Date: Thu, 1 Jan 1970 00:00:00 +0000
+Subject: [PATCH 097/126] top: Do not default to the cwd in configs_read().
+
+If the HOME environment variable is not set, or not absolute, use the
+home directory returned by getpwuid(getuid()), if set and absolute
+(instead of the cwd "."); otherwise, set p_home to NULL.
+
+To keep the changes to a minimum, we rely on POSIX, which requires that
+fopen() fails with ENOENT if the pathname (Rc_name) is an empty string.
+This integrates well into the existing code, and makes write_rcfile()
+work without a change.
+
+Also, it makes the code in configs_read() easier to follow: only set and
+use p_home if safe, and only set Rc_name if safe (in all the other cases
+it is the empty string, and the fopen() calls fail). Plus, check for
+snprintf() truncation (and if it happens, reset Rc_name to the empty
+string).
+
+Important note: top.1 should probably be updated, since it mentions the
+fallback to the current working directory.
+[carnil: Backport to 3.3.12: p_home -> p, context]
+
+Signed-off-by: Qualys Security Advisory <qsa@qualys.com>
+---
+ top/top.c | 33 ++++++++++++++++++++++++++++-----
+ 1 file changed, 28 insertions(+), 5 deletions(-)
+
+--- a/top/top.c
++++ b/top/top.c
+@@ -3423,6 +3423,19 @@ static int config_cvt (WIN_t *q) {
+    return 0;
+ } // end: config_cvt
+ 
++static int snprintf_Rc_name (const char *const format, ...) __attribute__((format(printf,1,2)));
++static int snprintf_Rc_name (const char *const format, ...) {
++   int len;
++   va_list ap;
++   va_start(ap, format);
++   len = vsnprintf(Rc_name, sizeof(Rc_name), format, ap);
++   va_end(ap);
++   if (len <= 0 || (size_t)len >= sizeof(Rc_name)) {
++      Rc_name[0] = '\0';
++      return 0;
++   }
++   return len;
++}
+ 
+         /*
+          * Build the local RC file name then try to read both of 'em.
+@@ -3445,8 +3458,17 @@ static void configs_read (void) {
+    FILE *fp;
+    int i;
+ 
++   Rc_name[0] = '\0'; // "fopen() shall fail if pathname is an empty string."
+    p = getenv("HOME");
+-   snprintf(Rc_name, sizeof(Rc_name), "%s/.%src", (p && *p) ? p : ".", Myname);
++   if (!p || p[0] != '/') {
++      const struct passwd *const pwd = getpwuid(getuid());
++      if (!pwd || !(p = pwd->pw_dir) || p[0] != '/') {
++         p = NULL;
++      }
++   }
++   if (p) {
++      snprintf_Rc_name("%s/.%src", p, Myname);
++   }
+ 
+    fp = fopen(SYS_RCFILESPEC, "r");
+    if (fp) {
diff --git a/meta/recipes-extended/procps/procps/CVE-2018-1123.patch b/meta/recipes-extended/procps/procps/CVE-2018-1123.patch
new file mode 100644
index 0000000..a2060e8
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/CVE-2018-1123.patch
@@ -0,0 +1,84 @@
+From 136e3724952827bbae8887a42d9d2b6f658a48ab Mon Sep 17 00:00:00 2001
+From: Qualys Security Advisory <qsa@qualys.com>
+Date: Thu, 1 Jan 1970 00:00:00 +0000
+Subject: [PATCH] ps/output.c: Fix outbuf overflows in pr_args() etc.
+
+Because there is usually less than OUTBUF_SIZE available at endp.
+
+Signed-off-by: Qualys Security Advisory <qsa@qualys.com>
+---
+ ps/output.c | 23 ++++++++++++++---------
+ 1 file changed, 14 insertions(+), 9 deletions(-)
+
+diff --git a/ps/output.c b/ps/output.c
+index 0c63bb6..4456f28 100644
+--- a/ps/output.c
++++ b/ps/output.c
+@@ -389,6 +389,9 @@ Modifications to the arguments are not shown.
+ 
+ // FIXME: some of these may hit the guard page in forest mode
+ 
++#define OUTBUF_SIZE_AT(endp) \
++  (((endp) >= outbuf && (endp) < outbuf + OUTBUF_SIZE) ? (outbuf + OUTBUF_SIZE) - (endp) : 0)
++
+ /*
+  * "args", "cmd", "command" are all the same:  long  unless  c
+  * "comm", "ucmd", "ucomm"  are all the same:  short unless -f
+@@ -402,15 +405,15 @@ static int pr_args(char *restrict const outbuf, const proc_t *restrict const pp)
+   rightward -= fh;
+ 
+   if(pp->cmdline && !bsd_c_option)
+-    endp += escaped_copy(endp, *pp->cmdline, OUTBUF_SIZE, &rightward);
++    endp += escaped_copy(endp, *pp->cmdline, OUTBUF_SIZE_AT(endp), &rightward);
+   else
+-    endp += escape_command(endp, pp, OUTBUF_SIZE, &rightward, ESC_DEFUNCT);
++    endp += escape_command(endp, pp, OUTBUF_SIZE_AT(endp), &rightward, ESC_DEFUNCT);
+ 
+-  if(bsd_e_option && rightward>1) {
++  if(bsd_e_option && rightward>1 && OUTBUF_SIZE_AT(endp)>1) {
+     if(pp->environ && *pp->environ) {
+       *endp++ = ' ';
+       rightward--;
+-      endp += escape_strlist(endp, pp->environ, OUTBUF_SIZE, &rightward);
++      endp += escape_strlist(endp, pp->environ, OUTBUF_SIZE_AT(endp), &rightward);
+     }
+   }
+   return max_rightward-rightward;
+@@ -429,15 +432,15 @@ static int pr_comm(char *restrict const outbuf, const proc_t *restrict const pp)
+   rightward -= fh;
+ 
+   if(pp->cmdline && unix_f_option)
+-    endp += escaped_copy(endp, *pp->cmdline, OUTBUF_SIZE, &rightward);
++    endp += escaped_copy(endp, *pp->cmdline, OUTBUF_SIZE_AT(endp), &rightward);
+   else
+-    endp += escape_command(endp, pp, OUTBUF_SIZE, &rightward, ESC_DEFUNCT);
++    endp += escape_command(endp, pp, OUTBUF_SIZE_AT(endp), &rightward, ESC_DEFUNCT);
+ 
+-  if(bsd_e_option && rightward>1) {
++  if(bsd_e_option && rightward>1 && OUTBUF_SIZE_AT(endp)>1) {
+     if(pp->environ && *pp->environ) {
+       *endp++ = ' ';
+       rightward--;
+-      endp += escape_strlist(endp, pp->environ, OUTBUF_SIZE, &rightward);
++      endp += escape_strlist(endp, pp->environ, OUTBUF_SIZE_AT(endp), &rightward);
+     }
+   }
+   return max_rightward-rightward;
+@@ -469,11 +472,13 @@ static int pr_fname(char *restrict const outbuf, const proc_t *restrict const pp
+   if (rightward>8)  /* 8=default, but forest maybe feeds more */
+     rightward = 8;
+ 
+-  endp += escape_str(endp, pp->cmd, OUTBUF_SIZE, &rightward);
++  endp += escape_str(endp, pp->cmd, OUTBUF_SIZE_AT(endp), &rightward);
+   //return endp - outbuf;
+   return max_rightward-rightward;
+ }
+ 
++#undef OUTBUF_SIZE_AT
++
+ /* elapsed wall clock time, [[dd-]hh:]mm:ss format (not same as "time") */
+ static int pr_etime(char *restrict const outbuf, const proc_t *restrict const pp){
+   unsigned long t;
+-- 
+2.14.3
+
diff --git a/meta/recipes-extended/procps/procps_3.3.12.bb b/meta/recipes-extended/procps/procps_3.3.12.bb
index ecf215f..29fa95e 100644
--- a/meta/recipes-extended/procps/procps_3.3.12.bb
+++ b/meta/recipes-extended/procps/procps_3.3.12.bb
@@ -14,6 +14,8 @@ inherit autotools gettext pkgconfig update-alternatives
 
 SRC_URI = "http://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-${PV}.tar.xz \
            file://sysctl.conf \
+           file://CVE-2018-1122.patch \
+           file://CVE-2018-1123.patch \
           "
 
 SRC_URI[md5sum] = "957e42e8b193490b2111252e4a2b443c"
-- 
2.7.4




